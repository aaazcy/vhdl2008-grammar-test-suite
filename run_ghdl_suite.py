#!/usr/bin/env python3
"""
Run the VHDL 2008 test suite through GHDL (open-source analyzer).

For each .vhd in cases_src:
  SYN/SEM (positive): syntax + analysis must SUCCEED
  SNN     (negative): must be REJECTED (syntax or analysis error)
  SMN     (negative): syntax must PASS, analysis must FAIL (semantic error)

Outputs:
  reports/ghdl_test_results.md   — summary matrix by type & chapter
  reports/ghdl_failures.csv      — every FAIL with error message
  reports/ghdl_warn_reject.csv   — every WARN_REJECT (relpath, ftype, error_summary)
  reports/ghdl_run_manifest.json — run manifest (FULL runs only; sync_all.py's
                                   verify_ghdl_gate uses it as freshness stamp)

Usage:
  python3 run_ghdl_suite.py                 # full suite (+manifest +warn_reject csv)
  python3 run_ghdl_suite.py --limit 50      # smoke test, first 50 files (no reports/manifest)
  python3 run_ghdl_suite.py --chapter ch03  # single chapter (no reports/manifest)
  python3 run_ghdl_suite.py --workers 16    # parallelism
"""

import os
import re
import sys
import csv
import glob
import json
import shutil
import tempfile
import argparse
import subprocess
from datetime import datetime, timezone
from concurrent.futures import ProcessPoolExecutor, as_completed

BASE = os.path.dirname(os.path.abspath(__file__))
CASES_SRC = os.path.join(BASE, 'vhdl2008_grammar_test', 'test_case_db', 'cases_src')
REPORTS = os.path.join(BASE, 'vhdl2008_grammar_test', 'reports')

# stdout/stderr may be pipes (called from sync_all.py /ghdl-verify logs) —
# force UTF-8 so Chinese summary lines never get GBK-mangled on Windows
# (same guard as generate_arch_pdf.py).
if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')
    sys.stderr.reconfigure(encoding='utf-8', errors='replace')

TIMEOUT = 60  # seconds per ghdl invocation

ALLOWLIST_PATH = os.path.join(REPORTS, 'ghdl_allowlist.csv')
MANIFEST_PATH = os.path.join(REPORTS, 'ghdl_run_manifest.json')
WARN_REJECT_PATH = os.path.join(REPORTS, 'ghdl_warn_reject.csv')

# Harness version stamped into ghdl_run_manifest.json (P2 hardening).
SUITE_VERSION = '2.0'

GHDL_WINGET_HINT = 'winget install ghdl.ghdl.ucrt64.mcode'


def _probe_ghdl_version(ghdl_path):
    """Parse the leading numeric version from `ghdl --version` (e.g. 6.0.0).
    Returns a tuple of ints, or None when the probe fails."""
    try:
        result = subprocess.run([ghdl_path, '--version'],
                                capture_output=True, text=True,
                                encoding='utf-8', errors='replace', timeout=10)
        m = re.search(r'(\d+)\.(\d+)\.(\d+)', result.stdout or '')
        if m and result.returncode == 0:
            return tuple(int(x) for x in m.groups())
    except Exception:
        pass
    return None


def find_ghdl():
    """Discover GHDL (P2): shutil.which('ghdl') first, then the winget Packages
    glob %LOCALAPPDATA%/Microsoft/WinGet/Packages/ghdl*/bin/ghdl.exe picking the
    highest version. Returns None when absent — the caller prints the winget
    install hint (never fabricate a binary)."""
    found = shutil.which('ghdl')
    if found:
        return found
    pkg_root = os.path.join(os.environ.get('LOCALAPPDATA', ''), 'Microsoft', 'WinGet', 'Packages')
    candidates = sorted(glob.glob(os.path.join(pkg_root, 'ghdl*', 'bin', 'ghdl.exe'))) if pkg_root else []
    if not candidates:
        return None
    best, best_ver = None, None
    for c in candidates:
        ver = _probe_ghdl_version(c)
        if ver is not None and (best_ver is None or ver > best_ver):
            best, best_ver = c, ver
    if best is not None:
        return best
    # All version probes failed — fall back to the most recently installed package
    return max(candidates, key=lambda c: os.path.getmtime(c))


def write_run_manifest(files_tested, total_files_at_run, ghdl_version):
    """Stamp the run manifest — called ONLY by full runs (no --limit/--chapter).

    sync_all.py's verify_ghdl_gate() treats a manifest whose total_files_at_run
    differs from the current cases_src file count as a stale-gate issue."""
    manifest = {
        'files_tested': files_tested,
        'total_files_at_run': total_files_at_run,
        'timestamp': datetime.now(timezone.utc).astimezone().isoformat(timespec='seconds'),
        'suite_version': SUITE_VERSION,
        'ghdl_version': ghdl_version,
    }
    with open(MANIFEST_PATH, 'w', encoding='utf-8') as f:
        json.dump(manifest, f, indent=2)


def get_ghdl_version(ghdl_path):
    """Query `ghdl --version`; fall back to hardcoded string on any failure."""
    try:
        result = subprocess.run([ghdl_path, '--version'],
                                capture_output=True, text=True,
                                encoding='utf-8', errors='replace', timeout=15)
        first_line = (result.stdout or '').strip().split('\n')[0]
        if result.returncode == 0 and first_line:
            return first_line
    except Exception:
        pass
    return 'GHDL 6.0.0 (mcode, --std=08)'


def classify_type(filename):
    """SYN / SNN / SEM / SMN from filename (SMN beats SEM for legacy names)."""
    if '_SYN_' in filename:
        return 'SYN'
    if '_SNN_' in filename:
        return 'SNN'
    if '_SMN_' in filename:
        return 'SMN'
    if '_SEM_' in filename:
        return 'SEM'
    return 'UNK'


def read_header_case_type(filepath):
    """Read '-- Case Type:' from the file header (first 15 lines)."""
    try:
        with open(filepath, 'r', encoding='utf-8', errors='replace') as f:
            for _ in range(15):
                line = f.readline()
                if not line:
                    break
                m = re.search(r'--\s*Case Type:\s*(\w+)', line, re.IGNORECASE)
                if m:
                    return m.group(1).capitalize()
    except Exception:
        pass
    return None


def resolve_type(filename, filepath):
    """Effective test type: header Case Type overrides filename-based type."""
    ftype = classify_type(filename)
    header = read_header_case_type(filepath)
    if not header:
        return ftype
    # Negative headers on SEM files → SMN; positive headers on SNN/SMN → SYN
    if header == 'Negative' and ftype == 'SEM':
        return 'SMN'
    if header == 'Positive' and ftype in ('SNN', 'SMN'):
        return 'SYN'
    return ftype


def load_allowlist():
    """Load GHDL limitation allowlist: set of relpaths excluded from FAIL counting."""
    if not os.path.exists(ALLOWLIST_PATH):
        return set()
    allow = set()
    with open(ALLOWLIST_PATH, 'r', encoding='utf-8-sig') as f:
        for row in csv.DictReader(f):
            if row.get('relpath'):
                allow.add(row['relpath'].strip())
    return allow


def run_ghdl(ghdl, args, workdir, env):
    """Run ghdl, return (returncode, stderr)."""
    try:
        result = subprocess.run(
            [ghdl] + args,
            cwd=workdir, env=env,
            capture_output=True, text=True,
            encoding='utf-8', errors='replace',
            timeout=TIMEOUT,
        )
        return result.returncode, result.stderr.strip()
    except subprocess.TimeoutExpired:
        return -99, 'TIMEOUT'


def test_one_file(ghdl_path, filepath, ftype, env, allowlist):
    """Run the two-stage GHDL check for a single file. Returns result dict."""
    stem = os.path.basename(filepath)
    relpath = os.path.relpath(filepath, CASES_SRC).replace('\\', '/')

    # Allowlisted files: report but don't count as FAIL
    if relpath in allowlist:
        return {
            'file': stem, 'relpath': relpath, 'type': ftype,
            'verdict': 'EXPECTED_FAIL', 'stage': 'allowlist', 'error': '',
        }

    workdir = tempfile.mkdtemp(prefix='ghdl_')

    try:
        # Stage 1: syntax check
        s_rc, s_err = run_ghdl(ghdl_path, ['-s', '--std=08', filepath], workdir, env)
        syntax_ok = (s_rc == 0)

        # Stage 2: analysis (semantic) — two passes for same-file package visibility
        a_rc, a_err = run_ghdl(ghdl_path, ['-a', '--std=08', '--workdir=' + workdir, filepath], workdir, env)
        if a_rc != 0:
            a_rc, a_err = run_ghdl(ghdl_path, ['-a', '--std=08', '--workdir=' + workdir, filepath], workdir, env)
        analysis_ok = (a_rc == 0)
    finally:
        shutil.rmtree(workdir, ignore_errors=True)

    # Classification — verdict driven by the ANALYSIS stage (-a):
    # GHDL's -s also performs binding/semantic checks, so for negative files
    # rejection at EITHER stage counts as the expected rejection.
    # Warning-only output (rc=0 with stderr) counts as rejection for negatives.
    warned = bool(s_err or a_err)
    if ftype in ('SYN', 'SEM'):
        verdict = 'PASS' if analysis_ok else 'FAIL'
    elif ftype in ('SNN', 'SMN'):
        if analysis_ok and not warned:
            verdict = 'FAIL'  # GHDL silently accepted
        elif analysis_ok and warned:
            verdict = 'WARN_REJECT'  # downgraded to warning — counted as PASS
        else:
            verdict = 'PASS'
    else:
        verdict = 'UNK'

    stage = 'syntax' if not syntax_ok else ('analysis' if not analysis_ok else 'none')
    err = s_err if not syntax_ok else a_err

    return {
        'file': stem,
        'relpath': relpath,
        'type': ftype,
        'verdict': verdict,
        'stage': stage,
        'error': err[:200].replace('\n', ' | '),
    }


def main():
    parser = argparse.ArgumentParser(description='Run VHDL suite through GHDL')
    parser.add_argument('--limit', type=int, default=0, help='Only test first N files (smoke)')
    parser.add_argument('--chapter', type=str, default='', help='Only this chapter folder (e.g. ch03_design_entities)')
    parser.add_argument('--workers', type=int, default=16, help='Parallel workers')
    args = parser.parse_args()

    ghdl_path = find_ghdl()
    if not ghdl_path:
        print(f'ERROR: ghdl not found (PATH + winget Packages glob). Install: {GHDL_WINGET_HINT}')
        sys.exit(1)
    print(f'GHDL: {ghdl_path}')
    ghdl_version = get_ghdl_version(ghdl_path)
    print(f'Version: {ghdl_version}')

    # GHDL needs its lib dir (libghdl DLL) — derive from bin dir
    env = os.environ.copy()
    lib_dir = os.path.join(os.path.dirname(ghdl_path), '..', 'lib')
    env['PATH'] = os.path.dirname(ghdl_path) + os.pathsep + lib_dir + os.pathsep + env.get('PATH', '')

    # Load GHDL limitation allowlist
    allowlist = load_allowlist()
    if allowlist:
        print(f'Allowlist: {len(allowlist)} file(s) excluded from FAIL counting')

    # Collect ALL files first (total_files_at_run feeds the freshness manifest);
    # chapter/limit filters apply afterwards. Only full runs may stamp the
    # manifest — partial runs must never pretend the whole tree was tested.
    all_files = []
    for chapter in sorted(os.listdir(CASES_SRC)):
        ch_path = os.path.join(CASES_SRC, chapter)
        if not os.path.isdir(ch_path) or not chapter.startswith('ch'):
            continue
        for root, _, fnames in os.walk(ch_path):
            for fname in sorted(fnames):
                if fname.endswith('.vhd'):
                    fp = os.path.join(root, fname)
                    all_files.append((fp, resolve_type(fname, fp)))
    total_files_at_run = len(all_files)

    files = all_files
    if args.chapter:
        files = [(fp, ft) for fp, ft in files
                 if os.path.relpath(fp, CASES_SRC).replace('\\', '/').split('/')[0] == args.chapter]
    if args.limit:
        files = files[:args.limit]
    is_full_run = not args.limit and not args.chapter

    # Unwrap into flat list for executor
    tasks = [(ghdl_path, fp, ft, env, allowlist) for fp, ft in files]

    print(f'Files to test: {len(tasks)} (workers={args.workers})')
    results = []
    done = 0
    total = len(tasks)

    with ProcessPoolExecutor(max_workers=args.workers) as pool:
        futures = {pool.submit(test_one_file, *t): t for t in tasks}
        for fut in as_completed(futures):
            done += 1
            try:
                results.append(fut.result())
            except Exception as e:
                _, fp, ft, _ = futures[fut]
                results.append({
                    'file': os.path.basename(fp), 'relpath': fp,
                    'type': ft, 'verdict': 'ERROR', 'stage': 'crash', 'error': str(e)[:200],
                })
            if done % 500 == 0 or done == total:
                print(f'  progress: {done}/{total}', flush=True)

    # Build summary — WARN_REJECT counts as PASS for negatives
    from collections import defaultdict, Counter
    def norm(v):
        return 'PASS' if v in ('PASS', 'WARN_REJECT') else v
    by_type = defaultdict(lambda: Counter())
    by_chapter = defaultdict(lambda: Counter())
    for r in results:
        by_type[r['type']][norm(r['verdict'])] += 1
        ch = r['relpath'].split('/')[0]
        by_chapter[ch][norm(r['verdict'])] += 1

    fails = [r for r in results if r['verdict'] == 'FAIL']
    warn_rejects = [r for r in results if r['verdict'] == 'WARN_REJECT']
    expected = [r for r in results if r['verdict'] == 'EXPECTED_FAIL']

    # Smoke/partial runs (--limit / --chapter) must NOT clobber the official
    # reports and must NOT stamp the run manifest (freshness gate stays intact).
    if not is_full_run:
        print('\n=== RESULTS (partial run - reports NOT written) ===')
        for t in ['SYN', 'SNN', 'SEM', 'SMN']:
            c = by_type.get(t, Counter())
            print(f'  {t:4s}: PASS={c.get("PASS", 0)} FAIL={c.get("FAIL", 0)}')
        print(f'  (WARN_REJECT counted as PASS: {len(warn_rejects)})')
        print(f'  (EXPECTED_FAIL allowlisted: {len(expected)})')
        print(f'\nFailures: {len(fails)}')
        print('Note: partial run - ghdl_failures.csv / ghdl_test_results.md / '
              'ghdl_warn_reject.csv / ghdl_run_manifest.json untouched.')
        return

    # Write failures CSV
    os.makedirs(REPORTS, exist_ok=True)
    csv_path = os.path.join(REPORTS, 'ghdl_failures.csv')
    with open(csv_path, 'w', newline='', encoding='utf-8-sig') as f:
        writer = csv.DictWriter(f, fieldnames=['type', 'verdict', 'stage', 'relpath', 'error'])
        writer.writeheader()
        for r in sorted(fails, key=lambda x: x['relpath']):
            writer.writerow({k: r[k] for k in ['type', 'verdict', 'stage', 'relpath', 'error']})

    # Write WARN_REJECT per-file list (P2) — semantics stay PASS (user decision)
    with open(WARN_REJECT_PATH, 'w', newline='', encoding='utf-8-sig') as f:
        writer = csv.DictWriter(f, fieldnames=['relpath', 'ftype', 'error_summary'])
        writer.writeheader()
        for r in sorted(warn_rejects, key=lambda x: x['relpath']):
            writer.writerow({'relpath': r['relpath'], 'ftype': r['type'],
                             'error_summary': r['error']})

    # Write summary report
    report_path = os.path.join(REPORTS, 'ghdl_test_results.md')
    lines = [
        '# GHDL Test Results',
        '',
        f'**Date**: {__import__("datetime").datetime.now().strftime("%Y-%m-%d %H:%M")}',
        f'**Tool**: {ghdl_version}',
        f'**Files tested**: {len(results)}',
        '',
        '## By Type',
        '',
        '| Type | PASS | FAIL | Rate |',
        '|---|---|---|---|',
    ]
    for t in ['SYN', 'SNN', 'SEM', 'SMN', 'UNK']:
        c = by_type.get(t, Counter())
        n_pass, n_fail = c.get('PASS', 0), c.get('FAIL', 0) + c.get('ERROR', 0)
        tot = n_pass + n_fail
        rate = f'{n_pass / tot * 100:.1f}%' if tot else '-'
        lines.append(f'| {t} | {n_pass} | {n_fail} | {rate} |')
    lines.append('')
    lines.append('## By Chapter')
    lines.append('')
    lines.append('| Chapter | PASS | FAIL |')
    lines.append('|---|---|---|')
    for ch in sorted(by_chapter):
        c = by_chapter[ch]
        lines.append(f'| {ch} | {c.get("PASS", 0)} | {c.get("FAIL", 0) + c.get("ERROR", 0)} |')
    lines.append('')
    lines.append('## Notes')
    lines.append('')
    lines.append('| Note | Count | Meaning |')
    lines.append('|---|---|---|')
    lines.append(f'| WARN_REJECT | {len(warn_rejects)} | Negative files accepted with warnings only — counted as PASS |')
    lines.append(f'| EXPECTED_FAIL | {len(expected)} | Allowlisted GHDL 6.0 limitations — not counted as FAIL |')
    lines.append('')
    lines.append(f'## Failures ({len(fails)})')
    lines.append('')
    lines.append(f'See [ghdl_failures.csv](ghdl_failures.csv) for details.')
    lines.append('')

    with open(report_path, 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))

    # Console summary
    print('\n=== RESULTS ===')
    for t in ['SYN', 'SNN', 'SEM', 'SMN']:
        c = by_type.get(t, Counter())
        print(f'  {t:4s}: PASS={c.get("PASS", 0)} FAIL={c.get("FAIL", 0)}')
    print(f'  (WARN_REJECT counted as PASS: {len(warn_rejects)})')
    print(f'  (EXPECTED_FAIL allowlisted: {len(expected)})')
    print(f'\nFailures: {len(fails)} -> {csv_path}')
    print(f'Report: {report_path}')

    # Full run — stamp the freshness manifest (verify_ghdl_gate reads it)
    write_run_manifest(len(results), total_files_at_run, ghdl_version)
    print(f'  WARN_REJECT full list ({len(warn_rejects)} entries) in ghdl_warn_reject.csv')
    print(f'Manifest: {MANIFEST_PATH} (total_files_at_run={total_files_at_run})')


if __name__ == '__main__':
    main()
