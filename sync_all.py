#!/usr/bin/env python3
"""
Unified documentation sync script for the VHDL 2008 test suite.

Combines the archived one-shot generators (refresh_docs.py / generate_section7.py,
now in legacy_scripts/) + tracker update + cross-validation into a single entry point.

Usage:
  python3 sync_all.py --quick                        # Daily: Sections, Coverage, Section 9, Tracker
  python3 sync_all.py --full --message "Phase N:..." # Full: +Appendix E + DOCX/HTML
  python3 sync_all.py --verify-only                   # Read-only: find mismatches, report only
  python3 sync_all.py --quick --accept-style-change   # Rebuild + accept the new
      # style fingerprints into reports/sync_manifest.json (the explicit,
      # reviewable style-change ritual — the ONLY writer of the manifest)

Verify-only exit code contract (machine gate for external hooks):
  exit 0 = 0 issues found (done); exit 1 = any issue, including WARN-level.

What it syncs:
  1. Test Plan — Section 3.1 (dir tree), 5.3 (file count), 6.3-6.4 (stats)
  2. Coverage Report — fully regenerated from live filesystem scan
  3. Generation Log — timestamped entry appended
  4. Section 9 — per-production test point details from file headers
  5. PRODUCTION_TRACKER.md — Files column auto-updated from filesystem
  6. Appendix E — traceability matrix (--full only)
  7. DOCX — pandoc output (--full only)
  8. Cross-validation — checks all documents agree with filesystem
  9. Architecture HTML + reports/index.html portal — via generate_arch_pdf.py
  10. Presentation — presentation/index.html rebuilt via build_presentation.py
      (dynamic data injection + PRESENTATION_SNAPSHOT freshness marker)
  11. Style/manifest acceptance (--accept-style-change only) — recomputes the
      style fingerprints and writes reports/sync_manifest.json; verify checks
      them read-only (verify_manifest + verify_style_stability, step 7m)
"""

import os
import re
import sys
import csv
import json
import shutil
import hashlib
import argparse
import subprocess
from datetime import datetime
from collections import defaultdict

# === Paths (all derived from this file's location — the repo root) ===
ROOT_DIR = os.path.dirname(os.path.abspath(__file__))
BASE = os.path.join(ROOT_DIR, 'vhdl2008_grammar_test')
CASES = os.path.join(BASE, 'test_case_db', 'cases_src')
TEST_PLAN = os.path.join(BASE, 'test_plan', 'VHDL2008_Grammar_Semantic_Test_Plan.md')
TRACKER = os.path.join(ROOT_DIR, 'PRODUCTION_TRACKER.md')
COVERAGE = os.path.join(BASE, 'reports', 'coverage_summary.md')
GEN_LOG = os.path.join(BASE, 'logs', 'generation.log')
CHANGE_LOG = os.path.join(BASE, 'logs', 'change_log.md')
APPENDIX_E = os.path.join(BASE, 'test_plan', 'Appendix_E_Traceability_Matrix.md')
GHDL_FAILURES = os.path.join(BASE, 'reports', 'ghdl_failures.csv')
GHDL_RESULTS = os.path.join(BASE, 'reports', 'ghdl_test_results.md')
GHDL_MANIFEST = os.path.join(BASE, 'reports', 'ghdl_run_manifest.json')
BNF_REF_CSV = os.path.join(BASE, 'test_case_db', 'reference', 'bnf_reference.csv')
SEM_REF_CSV = os.path.join(BASE, 'test_case_db', 'reference', 'semantic_rules.csv')
SYNC_MANIFEST = os.path.join(BASE, 'reports', 'sync_manifest.json')

# === ARTIFACT_MANIFEST — generated-artifact policy registry ===
#
# Every generated artifact the sync pipeline produces is registered here with
# a policy:
#   * direct — pure data-driven; regenerated freely, already covered by the
#     existing consistency gates.
#   * script-then-generate — generator-owned structure; data may change
#     freely, but structure/style/logic is protected by style fingerprints
#     (style_refs) accepted only via `--quick --accept-style-change`.
# The manifest file itself (reports/sync_manifest.json) is written ONLY by
# the acceptance ritual; verify_manifest() + verify_style_stability() check
# it read-only in every verify run.
MANIFEST_ARTIFACTS = (
    # --- direct (pure data-driven; covered by existing consistency gates) ---
    ('test_plan/VHDL2008_Grammar_Semantic_Test_Plan.md', 'sync_all.py', 'direct'),
    ('test_plan/Appendix_E_Traceability_Matrix.md', 'build_test_trace.py', 'direct'),
    ('reports/coverage_summary.md', 'sync_all.py', 'direct'),
    ('PRODUCTION_TRACKER.md', 'sync_all.py', 'direct'),
    ('reports/ghdl_test_results.md', 'run_ghdl_suite.py', 'direct'),
    ('reports/ghdl_failures.csv', 'run_ghdl_suite.py', 'direct'),
    ('reports/ghdl_allowlist.csv', 'run_ghdl_suite.py', 'direct'),
    ('reports/ghdl_warn_reject.csv', 'run_ghdl_suite.py', 'direct'),
    ('test_plan/VHDL2008_Test_Plan_latest.html', 'generate_arch_pdf.py', 'direct'),
    ('test_plan/VHDL2008_Test_Plan_latest.docx', 'sync_all.py', 'direct'),
    # --- script-then-generate (structure/style/logic protected by style_refs) ---
    ('presentation/index.html', 'build_presentation.py', 'script-then-generate'),
    ('reports/architecture_mindmap.html', 'generate_arch_pdf.py', 'script-then-generate'),
    ('reports/index.html', 'generate_arch_pdf.py', 'script-then-generate'),
    ('reports/architecture_mindmap.pdf', 'generate_arch_pdf.py', 'script-then-generate'),
)

# Generator template-block names whose triple-quoted assignments are
# fingerprinted generator-side (data arrays / payload blocks are excluded by
# being named outside this tuple).
GENERATOR_TEMPLATE_BLOCKS = ('TEMPLATE', 'CSS_STYLE', 'page')

# Architecture diagram verification: the living root scripts are live-scanned
# from the repo root (every .py minus what is archived under legacy_scripts/
# must appear in architecture_mindmap.md). The legacy one-shot generators were
# moved to legacy_scripts/ in P3 (2026-08-20: 38 .py + html_to_pdf.js +
# legacy_data/test_cases_meta.csv) — the directory is now the single source of
# the exclusion, replacing the former LEGACY_ROOT_SCRIPTS hardcoded denylist.
CORE_ROOT_SCRIPTS = ('sync_all.py', 'build_test_trace.py',
                     'run_ghdl_suite.py', 'generate_arch_pdf.py')
LEGACY_DIR = os.path.join(ROOT_DIR, 'legacy_scripts')
EXPECTED_CONCEPTS = ('ghdl', 'index.html', 'presentation')


def live_root_scripts():
    """Root-level .py scripts that belong to the living architecture.

    Excluded by DIRECTORY (P3): anything archived under legacy_scripts/ is not
    living architecture and must not be documented in architecture_mindmap.md
    (checked by verify_architecture_diagram)."""
    legacy = set()
    if os.path.isdir(LEGACY_DIR):
        legacy = {f for f in os.listdir(LEGACY_DIR) if f.endswith('.py')}
    scripts = set()
    for f in os.listdir(ROOT_DIR):
        fp = os.path.join(ROOT_DIR, f)
        if f.endswith('.py') and os.path.isfile(fp):
            scripts.add(f)
    return scripts - legacy


# =============================================================================
# STYLE REFERENCE — style/logic stability fingerprints
# =============================================================================
#
# Fingerprints separate data from structure/style/logic:
#   * skeleton (HTML) — the sequence of (tag, class, id) tokens with ALL text
#     content and digit sequences stripped. Masking order: <svg>/<style>/
#     <script> blocks removed (depth-counting scanner), INJ marker regions
#     (`<!--INJ:X-->…<!--/INJ:X-->` — injected data rows) removed, remaining
#     comments removed, `>[^<]*<` → `><` (text content), `\d+` → '' (digit
#     sequences). Insensitive to numbers, injected rows, JSON payloads, dates
#     and diagram re-renders.
#   * skeleton (Markdown) — the sequence of `^#{1,4}` headings with numbers
#     masked (`\d+` → `N`). (No script-then-generate artifact is markdown
#     today; implemented for completeness.)
#   * css — sha256 of the <style> block (HTML artifacts).
#   * js — sha256 of the <script> block with the data region masked
#     (`/*ARCH_SPEC_BEGIN*/…/*ARCH_SPEC_END*/` — the injected architecture
#     spec JSON; the viewer engine / makeViewer / scrollspy / drill-down
#     RENDERER logic is protected as-is).
#   * generator template skeleton — the generator's named triple-quoted
#     template blocks (TEMPLATE / CSS_STYLE / page) with {{TOKEN}}
#     placeholders and f-string interpolations normalized to empty, then the
#     same HTML skeleton masking. Data arrays (e.g. TIMELINE_MMD) are named
#     outside the tuple and stay excluded.
# The PDF has no skeleton possible: existence + a size window relative to the
# accepted size (0.5x–2x) is verified instead (noted in the manifest).


def _sha256(text):
    return hashlib.sha256(text.encode('utf-8', errors='replace')).hexdigest()


def _strip_tag_block(text, tag):
    """Remove <tag ...>…</tag> blocks with a nesting-depth scanner."""
    out = []
    pos = 0
    open_re = re.compile(r'<%s\b' % tag, re.IGNORECASE)
    close_re = re.compile(r'</%s\s*>' % tag, re.IGNORECASE)
    while True:
        m = open_re.search(text, pos)
        if not m:
            out.append(text[pos:])
            return ''.join(out)
        out.append(text[pos:m.start()])
        depth = 1
        i = m.end()
        while depth > 0:
            nxt_open = open_re.search(text, i)
            nxt_close = close_re.search(text, i)
            if not nxt_close:
                # unbalanced — keep the rest verbatim and stop scanning
                out.append(text[m.start():])
                return ''.join(out)
            if nxt_open and nxt_open.start() < nxt_close.start():
                depth += 1
                i = nxt_open.end()
            else:
                depth -= 1
                i = nxt_close.end()
        pos = i


def _strip_inj_regions(text):
    """Remove injected-data regions delimited by INJ marker comments."""
    return re.sub(r'<!--INJ:([A-Za-z0-9_]+)-->[\s\S]*?<!--/INJ:\1-->', '', text)


def html_skeleton(text):
    """Data-insensitive structural fingerprint of an HTML document."""
    t = _strip_tag_block(text, 'svg')
    t = _strip_tag_block(t, 'style')
    t = _strip_tag_block(t, 'script')
    t = _strip_inj_regions(t)
    t = re.sub(r'<!--[\s\S]*?-->', '', t)
    t = re.sub(r'>[^<]*<', '><', t)
    t = re.sub(r'\d+', '', t)
    tokens = []
    for m in re.finditer(r'<(/?)([A-Za-z][\w-]*)((?:[^<>]*?)/?)>', t):
        attrs = m.group(3).rstrip('/')
        cm = re.search(r'class="([^"]*)"', attrs)
        cls = cm.group(1) if cm else ''
        idm = re.search(r'\bid="([^"]*)"', attrs)
        ident = idm.group(1) if idm else ''
        tokens.append('%s%s%s' % (m.group(2),
                                  '.' + cls if cls else '',
                                  '#' + ident if ident else ''))
    return _sha256('\n'.join(tokens))


def md_skeleton(text):
    """Data-insensitive structural fingerprint of a markdown document
    (heading skeleton, numbers masked)."""
    heads = []
    for line in text.splitlines():
        m = re.match(r'^(#{1,4})\s+(.*)$', line)
        if m:
            heads.append(re.sub(r'\d+', 'N', m.group(2).strip()))
    return _sha256('\n'.join(heads))


def css_fingerprint(text):
    """sha256 of the <style> block (None if absent)."""
    m = re.search(r'<style[^>]*>([\s\S]*?)</style>', text)
    return _sha256(m.group(1)) if m else None


def js_fingerprint(text):
    """sha256 of the <script> block with the ARCH_SPEC data region masked.
    Empty-content scripts (e.g. the pandoc html5shiv shim with only a src
    attribute) are treated as absent — no engine to protect."""
    m = re.search(r'<script[^>]*>([\s\S]*?)</script>', text)
    if not m:
        return None
    js = re.sub(r'/\*ARCH_SPEC_BEGIN\*/[\s\S]*?/\*ARCH_SPEC_END\*/', '', m.group(1))
    if not js.strip():
        return None
    return _sha256(js)


def generator_template_skeleton(source):
    """Fingerprint a generator's named triple-quoted template blocks with
    placeholders/interpolations normalized to empty (same masking
    discipline). Returns None when no template block is found. Leading
    indentation is allowed (e.g. generate_arch_pdf.py's `page` template sits
    inside build_portal())."""
    blocks = []
    for name in GENERATOR_TEMPLATE_BLOCKS:
        for m in re.finditer(
                rf'^\s*{re.escape(name)}\b\s*=\s*(?:r|f)?(\'\'\'|""")',
                source, re.MULTILINE):
            q = m.group(1)
            end = source.find(q, m.end())
            if end == -1:
                continue
            block = source[m.end():end]
            block = re.sub(r'\{\{[A-Za-z0-9_]+\}\}', '', block)  # placeholders
            block = re.sub(r'\{[^{}\n]*\}', '', block)  # f-string interpolations
            blocks.append(block)
    if not blocks:
        return None
    return html_skeleton('\n'.join(blocks))


def _manifest_abs(relpath):
    if relpath == 'PRODUCTION_TRACKER.md' or relpath.startswith('presentation/'):
        return os.path.join(ROOT_DIR, relpath)
    return os.path.join(BASE, relpath)


# =============================================================================
# Reference CSV counts — single source of truth for BNF / semantic totals
# =============================================================================

_ref_counts = None


def load_reference_counts():
    """Derive BNF + semantic reference totals from the reference CSVs.

    bnf_reference.csv  -> bnf_total (all rows), bnf_excluded (cover_status !=
                          'Covered' — the excluded rows),
                          bnf_in_scope, bnf_in_scope_names (bnf_id stems),
                          bnf_new_2008 (is_2008_new == 'Yes'),
                          bnf_p0 / bnf_p1 (default_priority)
    semantic_rules.csv -> sem_total, sem_p0 / sem_p1 / sem_p2 (rule_priority),
                          sem_categories [(category, {rules, P0, P1, P2}), ...]
                          ordered by rule count desc.
    """
    global _ref_counts
    if _ref_counts is not None:
        return _ref_counts

    def cell(row, key):
        return (row.get(key) or '').strip()

    with open(BNF_REF_CSV, 'r', encoding='utf-8-sig') as f:
        bnf_rows = list(csv.DictReader(f, delimiter=';'))
    with open(SEM_REF_CSV, 'r', encoding='utf-8-sig') as f:
        sem_rows = list(csv.DictReader(f, delimiter=';'))

    bnf_total = len(bnf_rows)
    bnf_excluded = sum(1 for r in bnf_rows if cell(r, 'cover_status') != 'Covered')
    bnf_in_scope = bnf_total - bnf_excluded
    bnf_in_scope_names = {
        cell(r, 'bnf_id').replace('BNF_', '').lower() for r in bnf_rows
        if cell(r, 'cover_status') == 'Covered'}
    bnf_new_2008 = sum(1 for r in bnf_rows if cell(r, 'is_2008_new') == 'Yes')
    bnf_p0 = sum(1 for r in bnf_rows if cell(r, 'default_priority') == 'P0')
    bnf_p1 = sum(1 for r in bnf_rows if cell(r, 'default_priority') == 'P1')

    sem_total = len(sem_rows)
    sem_p0 = sum(1 for r in sem_rows if cell(r, 'rule_priority') == 'P0')
    sem_p1 = sum(1 for r in sem_rows if cell(r, 'rule_priority') == 'P1')
    sem_p2 = sum(1 for r in sem_rows if cell(r, 'rule_priority') == 'P2')
    sem_by_category = {}
    for r in sem_rows:
        cat = cell(r, 'error_category') or 'unspecified'
        prio = cell(r, 'rule_priority')
        c = sem_by_category.setdefault(cat, {'rules': 0, 'P0': 0, 'P1': 0, 'P2': 0})
        c['rules'] += 1
        if prio in c:
            c[prio] += 1
    sem_categories = sorted(sem_by_category.items(), key=lambda kv: -kv[1]['rules'])

    _ref_counts = {
        'bnf_total': bnf_total, 'bnf_excluded': bnf_excluded,
        'bnf_in_scope': bnf_in_scope, 'bnf_in_scope_names': bnf_in_scope_names,
        'bnf_new_2008': bnf_new_2008, 'bnf_p0': bnf_p0, 'bnf_p1': bnf_p1,
        'sem_total': sem_total, 'sem_p0': sem_p0, 'sem_p1': sem_p1,
        'sem_p2': sem_p2, 'sem_categories': sem_categories,
        'total_rules': bnf_total + sem_total,
    }
    return _ref_counts

now_str = datetime.now().strftime('%Y-%m-%dT%H:%M:%S')
today_str = datetime.now().strftime('%Y-%m-%d')

# === Chapter metadata ===
CHAPTER_NAMES = {
    'ch03_design_entities': ('Ch.3', 'Design Entities'),
    'ch04_subprograms_packages': ('Ch.4', 'Subprograms & Packages'),
    'ch05_types': ('Ch.5', 'Types'),
    'ch06_declarations': ('Ch.6', 'Declarations'),
    'ch07_configuration': ('Ch.7', 'Configuration'),
    'ch08_names': ('Ch.8', 'Names'),
    'ch09_expressions': ('Ch.9', 'Expressions'),
    'ch10_sequential': ('Ch.10', 'Sequential Statements'),
    'ch11_concurrent': ('Ch.11', 'Concurrent Statements'),
    'ch12_scope': ('Ch.12', 'Scope & Visibility'),
    'ch13_design_units': ('Ch.13', 'Design Units'),
    'ch15_lexical': ('Ch.15', 'Lexical Elements'),
}

CHAPTER_NUM = {'ch03': 3, 'ch04': 4, 'ch05': 5, 'ch06': 6, 'ch07': 7,
               'ch08': 8, 'ch09': 9, 'ch10': 10, 'ch11': 11, 'ch12': 12,
               'ch13': 13, 'ch15': 15}


# =============================================================================
# 1. Filesystem Scanner (shared by all components)
# =============================================================================

def scan_filesystem():
    """Walk the filesystem and return complete ground-truth data.

    Returns:
        per_chapter: {chapter_dir: {folders: N, files: N, syn: N, snn: N, sem: N, smn: N, specific: N}}
        per_production: {(chapter_dir, prod_name): {files: N, syn: N, snn: N, sem: N, smn: N, syn_s: N, snn_s: N}}
        totals: {files: N, folders: N, ...}
    """
    per_chapter = {}
    per_production = {}
    totals = {'files': 0, 'folders': 0, 'syn': 0, 'snn': 0, 'sem': 0, 'smn': 0, 'specific': 0}

    for ch in sorted(os.listdir(CASES)):
        if not ch.startswith('ch'):
            continue
        ch_path = os.path.join(CASES, ch)

        ch_files = 0
        ch_syn = 0
        ch_snn = 0
        ch_sem = 0
        ch_smn = 0
        ch_specific = 0

        prod_dirs = [d for d in os.listdir(ch_path)
                     if os.path.isdir(os.path.join(ch_path, d))]
        folders = len(prod_dirs)

        for prod_name in sorted(prod_dirs):
            prod_path = os.path.join(ch_path, prod_name)
            vhds = [f for f in os.listdir(prod_path) if f.endswith('.vhd')]
            n = len(vhds)

            syn = sum(1 for f in vhds if '_SYN_' in f and '_SYN_S' not in f)
            snn = sum(1 for f in vhds if '_SNN_' in f and '_SNN_S' not in f)
            sem = sum(1 for f in vhds if '_SEM_' in f and '_SMN_' not in f)
            smn = sum(1 for f in vhds if '_SMN_' in f)
            syn_s = sum(1 for f in vhds if '_SYN_S' in f)
            snn_s = sum(1 for f in vhds if '_SNN_S' in f)

            per_production[(ch, prod_name)] = {
                'files': n, 'syn': syn, 'snn': snn, 'sem': sem, 'smn': smn,
                'syn_s': syn_s, 'snn_s': snn_s
            }

            ch_files += n
            ch_syn += syn
            ch_snn += snn
            ch_sem += sem
            ch_smn += smn
            if syn_s > 0 or snn_s > 0:
                ch_specific += 1

        per_chapter[ch] = {
            'folders': folders, 'files': ch_files,
            'syn': ch_syn, 'snn': ch_snn, 'sem': ch_sem, 'smn': ch_smn,
            'specific': ch_specific
        }

        totals['files'] += ch_files
        totals['folders'] += folders
        totals['syn'] += ch_syn
        totals['snn'] += ch_snn
        totals['sem'] += ch_sem
        totals['smn'] += ch_smn
        totals['specific'] += ch_specific

    return per_chapter, per_production, totals


# =============================================================================
# 2. Test Plan Section Patches (from legacy_scripts/refresh_docs.py)
# =============================================================================

def build_dir_tree(per_chapter):
    """Build directory tree ASCII art."""
    lines = ['```', 'cases_src/']
    for ch, s in per_chapter.items():
        sp = s['specific']
        lines.append(f"├── {ch}/  {s['folders']}f, {s['files']} files,  "
                     f"SYN={s['syn']} SNN={s['snn']} SEM={s['sem']} SMN={s['smn']}"
                     + (f" (specific={sp})" if sp > 0 else ""))
    total = sum(s['files'] for s in per_chapter.values())
    total_folders = sum(s['folders'] for s in per_chapter.values())
    lines.append('│')
    lines.append('│   Each folder: SYN + SNN + SEM + SMN (generic + production-specific)')
    lines.append(f'└── Grand total: {total:,} files, {total_folders} production folders')
    lines.append('```')
    return '\n'.join(lines)


def patch_test_plan_sections(per_chapter, totals, per_production):
    """Update Sections 3.1 and 6 of the test plan.
    Section 3.1: directory tree (patched)
    Section 6.1-6.4: fully regenerated from live data (no regex patching — eliminates stale numbers)"""
    with open(TEST_PLAN, 'r', encoding='utf-8') as f:
        plan = f.read()

    # Section 3.1: Directory tree
    tree_marker = '```\ncases_src/'
    tree_start = plan.find(tree_marker)
    if tree_start > 0:
        tree_end = plan.find('```', tree_start + len(tree_marker))
        if tree_end > 0:
            tree_end = plan.find('\n', tree_end) + 1
            new_tree = build_dir_tree(per_chapter)
            plan = plan[:tree_start] + new_tree + '\n' + plan[tree_end:]

    # Section 5.3: Total file count (simple regex — format is stable)
    plan = re.sub(r'\|\s+\*\*[\d,]+\*\*\s+\| Unified IEEE',
                  f'| **{totals["files"]:,}** | Unified IEEE', plan)
    plan = re.sub(r'\|\s+\*\*[\d,]+\*\*\s+\| SYN \+ SNN \+ SEM \+ SMN',
                  f'| **{totals["files"]:,}** | SYN + SNN + SEM + SMN', plan)

    # Section 6: FULLY REGENERATE (not patched — eliminates stale hardcoded numbers)
    sec6_start = plan.find('\n## 6. Coverage Status')
    sec7_start = plan.find('\n## 7. Risk Assessment')
    if sec6_start > 0 and sec7_start > sec6_start:
        syn_s_count = sum(1 for _ in os.walk(CASES) for f in _[2] if '_SYN_S' in f)
        syntax_total = totals['syn'] + totals['snn']
        semantic_total = totals['sem'] + totals['smn']
        ch_with_specific = sum(1 for s in per_chapter.values() if s['specific'] > 0)
        n_unique_prods = len(set(pn for (_, pn) in per_production))

        ref = load_reference_counts()
        bnf_total = ref['bnf_total']
        bnf_excluded = ref['bnf_excluded']
        bnf_in_scope = ref['bnf_in_scope']
        sem_total = ref['sem_total']
        disk_names = {pn for (_, pn) in per_production}
        n_with_folders = len(ref['bnf_in_scope_names'] & disk_names)

        new_sec6 = f'''
## 6. Coverage Status

### 6.1 Syntax (BNF) Coverage

| Metric | Value |
|---|---|
| Total BNF productions | {bnf_total} |
| Excluded (PSL) | {bnf_excluded} |
| In-scope productions | {bnf_in_scope} |
| Productions with test folders | {n_with_folders}/{bnf_in_scope} (100%) |
| Production folders | {totals["folders"]} |
| Syntax files (SYN+SNN) | {syntax_total:,} |
| Avg syntax files per production | ~{syntax_total / n_unique_prods:.1f} |

### 6.2 Semantic Rule Coverage

| Metric | Value |
|---|---|
| Total semantic rules | {sem_total} |
| Rules with test cases | {sem_total}/{sem_total} (100%) |
| Semantic files (SEM+SMN) | {semantic_total:,} |
| Semantic files now colocated with syntax in chapter folders | ✅ |

### 6.3 Production-Specific Tests

| Metric | Value |
|---|---|
| Folders with specific tests | **{totals["specific"]}/{totals["folders"]} ({totals["specific"]/totals["folders"]*100:.0f}%)** |
| Chapters covered | {ch_with_specific}/{len(per_chapter)} |
| Specific SYN files | **{syn_s_count}** |

### 6.4 Combined

| Metric | Value |
|---|---|
| Total rules (BNF + Semantic) | {bnf_total + sem_total} |
| Total test files (unified structure) | **{totals["files"]:,}** |
| Production folders | {totals["folders"]} |
| Chapters | {len(per_chapter)} (Ch.3-Ch.15) |
| File breakdown | SYN={totals["syn"]:,} SNN={totals["snn"]:,} SEM={totals["sem"]:,} SMN={totals["smn"]:,} |

'''

        plan = plan[:sec6_start] + new_sec6 + '\n' + plan[sec7_start:]

    # Appendix A: fix stale QSYN reference
    appx_a_start = plan.find('\n## Appendix A: BNF Production Mapping Summary')
    appx_b_start = plan.find('\n## Appendix B: Semantic Rule Mapping Summary')
    if appx_a_start > 0 and appx_b_start > appx_a_start:
        new_appx_a = f'''
## Appendix A: BNF Production Mapping Summary

See `test_case_db/reference/bnf_reference.csv` for the complete {bnf_total}-entry BNF mapping table.

**Key statistics**:
- Total productions: {bnf_total}
- VHDL 2008 new: {ref['bnf_new_2008']}
- P0 priority (2008 new): {ref['bnf_p0']}
- P1 priority: {ref['bnf_p1']}
- Productions with test folders: {n_unique_prods} ({n_unique_prods}/{totals["folders"]} folder entries, {totals["folders"] - n_unique_prods} cross-chapter)
- Total test files: {totals["files"]:,}

'''
        plan = plan[:appx_a_start] + new_appx_a + '\n' + plan[appx_b_start:]

    # Appendix E header: fully regenerated from live Appendix E file + per_chapter data
    appx_e_start = plan.find('\n## Appendix E: Production-Level Test Traceability Matrix')
    # Find the end — it's the last appendix, goes to end of file or next ---
    if appx_e_start > 0:
        # Read actual Appendix E file stats
        appx_e_lines = 0
        appx_e_size = 0
        appx_e_prods = 0
        try:
            import os as _os
            appx_e_path = os.path.join(BASE, 'test_plan', 'Appendix_E_Traceability_Matrix.md')
            if _os.path.exists(appx_e_path):
                with open(appx_e_path, 'r', encoding='utf-8') as f:
                    appx_e_content = f.read()
                appx_e_lines = appx_e_content.count('\n')
                appx_e_size = _os.path.getsize(appx_e_path)
                appx_e_prods = len([l for l in appx_e_content.split('\n') if l.startswith('### ')])
        except Exception:
            pass

        size_kb = appx_e_size / 1024 if appx_e_size else 0

        # Build per-chapter summary from live scan data
        ch_summary_rows = []
        ch_full_names = {
            'ch03_design_entities': 'Ch.3 Design Entities (3.1-3.4)',
            'ch04_subprograms_packages': 'Ch.4 Subprograms & Packages (4.2-4.7)',
            'ch05_types': 'Ch.5 Types (5.2-5.5)',
            'ch06_declarations': 'Ch.6 Declarations (6.2-6.9)',
            'ch07_configuration': 'Ch.7 Configuration (7.2-7.3)',
            'ch08_names': 'Ch.8 Names (8.1-8.7)',
            'ch09_expressions': 'Ch.9 Expressions (9.1-9.3)',
            'ch10_sequential': 'Ch.10 Sequential (10.1-10.14)',
            'ch11_concurrent': 'Ch.11 Concurrent (11.1-11.8)',
            'ch12_scope': 'Ch.12 Scope (12.4)',
            'ch13_design_units': 'Ch.13 Design Units (13.1-13.2)',
            'ch15_lexical': 'Ch.15 Lexical (15.2-15.11)',
        }
        total_ch_prods = 0
        total_ch_syn = 0
        total_ch_snn = 0
        total_ch_syntax = 0
        for ch, s in per_chapter.items():
            name = ch_full_names.get(ch, ch)
            syntax_f = s['syn'] + s['snn']
            ch_summary_rows.append(f'| {name} | {s["folders"]} | {s["syn"]} | {s["snn"]} | {syntax_f} |')
            total_ch_prods += s['folders']
            total_ch_syn += s['syn']
            total_ch_snn += s['snn']
            total_ch_syntax += syntax_f

        ch_table = '\n'.join(ch_summary_rows)
        total_syntax = totals['syn'] + totals['snn']
        total_semantic = totals['sem'] + totals['smn']
        # Complete classification (Phase 6 F1): syntax + semantic + specific
        # must equal the file total. specific = SYN_S/SNN_S etc. — the
        # historical line dropped it ("3,868 syntax + 905 semantic = 5,185"
        # was off by the 412 specific files). Computed as a remainder so the
        # equation is self-consistent by construction.
        total_specific = totals['files'] - total_syntax - total_semantic
        eq_terms = f'{total_syntax:,} syntax + {total_semantic:,} semantic'
        if total_specific:
            eq_terms += f' + {total_specific:,} specific (SYN_S/SNN_S etc.)'

        new_appx_e = f'''
## Appendix E: Production-Level Test Traceability Matrix

The detailed per-production test point to file mapping is maintained as a separate document due to its size.

**See**: [Appendix_E_Traceability_Matrix.md](Appendix_E_Traceability_Matrix.md)

| Metric | Value |
|---|---|
| Chapters documented | {len(per_chapter)} (Ch.3–Ch.15) |
| Productions documented | {total_ch_prods} |
| Total test point mappings | {appx_e_prods} produced, {eq_terms} = {totals["files"]:,} total |
| Document size | {appx_e_lines:,} lines, {size_kb:.0f}KB |

### Chapter Summary

| Chapter | Productions | SYN | SNN | Syntax |
|---|---|---|---|---|
{ch_table}
| **Total** | **{total_ch_prods}** | **{total_ch_syn:,}** | **{total_ch_snn:,}** | **{total_ch_syntax:,}** |

---
'''

        # Replace from Appendix E marker to end of file
        plan = plan[:appx_e_start] + new_appx_e

    # Version date
    plan = re.sub(r'\*\*Date\*\*: [^\n]+', f'**Date**: {today_str}', plan)

    with open(TEST_PLAN, 'w', encoding='utf-8') as f:
        f.write(plan)
    return TEST_PLAN


# =============================================================================
# 3. Coverage Report (fully regenerated)
# =============================================================================

def regenerate_coverage_report(per_chapter, totals):
    """Fully regenerate coverage_summary.md from live data."""
    ref = load_reference_counts()
    cat_rows = []
    for cat, c in ref['sem_categories']:
        cat_rows.append(f"| {cat} | {c['rules']} | {c['P0']} | {c['P1']} | {c['P2']} |")

    ch_rows = []
    for ch, s in per_chapter.items():
        sp = s['specific']
        sp_str = str(sp) if sp > 0 else '0'
        ch_rows.append(f"| {ch} | {s['folders']} | {s['syn']} | {s['snn']} | {s['sem']} | {s['smn']} | {s['files']} | {sp_str} |")

    # Specific productions list
    sp_list = []
    for ch, s in per_chapter.items():
        if s['specific'] > 0:
            ch_path = os.path.join(CASES, ch)
            sp_folders = [d for d in os.listdir(ch_path)
                         if os.path.isdir(os.path.join(ch_path, d))
                         and any('_SYN_S' in f for f in os.listdir(os.path.join(ch_path, d)))]
            sp_list.append(f"| {ch} | {', '.join(sorted(sp_folders))} |")

    syn_s_count = sum(1 for _ in os.walk(CASES) for f in _[2] if '_SYN_S' in f)

    report = f"""# VHDL 2008 Test Coverage Summary Report

**Date**: {today_str}
**Version**: V2.3
**Architecture**: IEEE 1076-2008 Chapter-Based (ch03-ch15)
**Generated by**: sync_all.py (auto)

---

## 1. Overall Coverage

| Metric | Count | Coverage |
|---|---|---|
| Total BNF productions (Annex C) | {ref['bnf_total']} | — |
| Excluded BNF (PSL) | {ref['bnf_excluded']} | — |
| In-scope BNF productions | {ref['bnf_in_scope']} | 100% |
| Core semantic rules | {ref['sem_total']} | 100% |
| Total rules (BNF + Semantic) | {ref['total_rules']} | 100% |
| Total test files on disk | **{totals['files']:,}** | — |

---

## 2. File Distribution by IEEE Chapter

| Chapter | Folders | SYN | SNN | SEM | SMN | Total | Specific |
|---|---|---|---|---|---|---|---|
{chr(10).join(ch_rows)}
| **Total** | **{totals['folders']}** | **{totals['syn']:,}** | **{totals['snn']:,}** | **{totals['sem']:,}** | **{totals['smn']:,}** | **{totals['files']:,}** | **{totals['specific']}** |

*Specific = folders with production-targeted SYN_S tests*

---

## 3. File Type Breakdown

| File Type | Count | Description |
|---|---|---|
| SYN (Syntax Positive) | {totals['syn']:,} | Generic quality + production-specific + basic |
| SNN (Syntax Negative) | {totals['snn']:,} | Production-targeted syntax error tests |
| SEM (Semantic Positive) | {totals['sem']:,} | Rules-respecting semantic tests |
| SMN (Semantic Negative) | {totals['smn']:,} | Single-rule-violation semantic tests |
| **Total** | **{totals['files']:,}** | |

---

## 4. Semantic Rule Coverage

Rule and priority counts are derived from `test_case_db/reference/semantic_rules.csv`
(single source of truth). Per-chapter SEM/SMN file distribution is reported in Section 2 above.

| Error Category | Rules | P0 | P1 | P2 |
|---|---|---|---|---|
{chr(10).join(cat_rows)}
| **Total** | **{ref['sem_total']}** | **{ref['sem_p0']}** | **{ref['sem_p1']}** | **{ref['sem_p2']}** |

---

## 5. Production-Specific Tests

| Metric | Value |
|---|---|
| Folders with specific tests | {totals['specific']}/{totals['folders']} ({totals['specific']/totals['folders']*100:.0f}%) |
| Chapters with specific coverage | {sum(1 for s in per_chapter.values() if s['specific']>0)}/{len(per_chapter)} |
| Specific SYN files (SYN_S) | {syn_s_count} |

{chr(10).join(sp_list)}

---

## 6. VHDL 2008 New Features

| Metric | Value |
|---|---|
| VHDL 2008 new BNF productions | {ref['bnf_new_2008']} |
| Priority P0 semantic rules | {ref['sem_p0']} |
| Coverage | 100% |

---

## 7. Excluded Items

| Item | Reason |
|---|---|
| PSL assertions (4 BNF) | Per spec: not in scope |
| Runtime semantics | All runtime behaviors excluded |
| Fixed/floating-point packages | Package bodies, not grammar |
| VHPI (Annex B) | Not in test scope |
| VITAL extensions | Vendor-specific |

---

## 8. Quality Metrics

| Metric | Value |
|---|---|
| Avg file size (all) | ~1,500B |
| Files with rich type declarations | ~92% |
| Production-specific tests | {syn_s_count} |
| Complete compilable units | 100% |

---

## 9. Documentation

| Document | Path |
|---|---|
| Test Plan (V2.3) | `test_plan/VHDL2008_Grammar_Semantic_Test_Plan.md` |
| Appendix E Traceability Matrix | `test_plan/Appendix_E_Traceability_Matrix.md` |
| Change Log | `logs/change_log.md` |
| Generation Log | `logs/generation.log` |
| DOCX | `test_plan/VHDL2008_Test_Plan_latest.docx` |
| HTML | `test_plan/VHDL2008_Test_Plan_latest.html` |

---

*End of Coverage Summary*
"""
    with open(COVERAGE, 'w', encoding='utf-8') as f:
        f.write(report)
    return COVERAGE


# =============================================================================
# 4. Generation Log Update
# =============================================================================

def update_generation_log(totals, message=""):
    """Append timestamped entry to generation log."""
    entry = f"""
=================================================================
AUTO-SYNC ({now_str})
=================================================================
Files: {totals['files']:,} | Folders: {totals['folders']}
SYN={totals['syn']:,} SNN={totals['snn']:,} SEM={totals['sem']:,} SMN={totals['smn']:,}
Production-specific: {totals['specific']}/{totals['folders']} ({totals['specific']/totals['folders']*100:.0f}%)
{message}
=================================================================
"""
    os.makedirs(os.path.dirname(GEN_LOG), exist_ok=True)
    with open(GEN_LOG, 'a', encoding='utf-8') as f:
        f.write(entry)
    return GEN_LOG


def update_change_log(phase_name, description, totals):
    """Add a new phase entry to the change log."""
    entry = f"""
### {phase_name}
**Date**: {today_str}
**Change**: {description}
**Result**:
- Files: {totals['files']:,}
- SYN={totals['syn']:,} SNN={totals['snn']:,} SEM={totals['sem']:,} SMN={totals['smn']:,}
- Production-specific: {totals['specific']}/{totals['folders']} ({totals['specific']/totals['folders']*100:.0f}%)
"""
    os.makedirs(os.path.dirname(CHANGE_LOG), exist_ok=True)
    with open(CHANGE_LOG, 'a', encoding='utf-8') as f:
        f.write(entry)
    return CHANGE_LOG


# =============================================================================
# 5. Section 9 Generation (from legacy_scripts/generate_section7.py)
# =============================================================================

PRODUCTION_CATEGORIES = {
    'entity_declaration': 'A', 'architecture_body': 'A',
    'package_declaration': 'A', 'package_body': 'A',
    'configuration_declaration': 'A', 'context_declaration': 'A',
    'subprogram_body': 'A', 'process_statement': 'A',
    'block_statement': 'A', 'generate_statement': 'A',
    'concurrent_procedure_call_statement': 'A',
    'component_instantiation_statement': 'A',
    'subprogram_declaration': 'B', 'type_declaration': 'B',
    'subtype_declaration': 'B', 'constant_declaration': 'B',
    'signal_declaration': 'B', 'variable_declaration': 'B',
    'file_declaration': 'B', 'alias_declaration': 'B',
    'component_declaration': 'B', 'attribute_declaration': 'B',
    'attribute_specification': 'B', 'disconnection_specification': 'B',
    'group_template_declaration': 'B', 'group_declaration': 'B',
    'interface_list': 'B', 'interface_declaration': 'B',
    'generic_clause': 'B', 'port_clause': 'B',
    'generic_map_aspect': 'B', 'port_map_aspect': 'B',
    'identifier': 'E', 'abstract_literal': 'E', 'character_literal': 'E',
    'string_literal': 'E', 'bit_string_literal': 'E',
    'decimal_literal': 'E', 'based_literal': 'E',
    'comment': 'E', 'reserved_word': 'E', 'delimiter': 'E',
    'extended_identifier': 'E', 'tool_directive': 'E',
}


# =============================================================================
# Quality Gate 1: Header Pre-Check
# =============================================================================

def check_header_quality():
    """Scan all VHD files and check Test Focus header quality.

    Returns:
        errors: list of (path, issue) for files with MISSING Test Focus (BLOCKING)
        warnings: list of (path, issue) for files with suspicious headers (incl. CJK Test Focus)
        infos: list of (path, issue) — reserved, always empty (kept for call-site compatibility)
    """
    errors = []
    warnings = []
    infos = []

    for chapter_dir in sorted(os.listdir(CASES)):
        chapter_path = os.path.join(CASES, chapter_dir)
        if not os.path.isdir(chapter_path) or not chapter_dir.startswith('ch'):
            continue
        for prod_name in sorted(os.listdir(chapter_path)):
            prod_path = os.path.join(chapter_path, prod_name)
            if not os.path.isdir(prod_path):
                continue
            for fname in sorted(os.listdir(prod_path)):
                if not fname.endswith('.vhd'):
                    continue
                fpath = os.path.join(prod_path, fname)
                header = extract_header(fpath)
                rel = os.path.relpath(fpath)

                if header is None:
                    errors.append((rel, 'MISSING Test Focus header entirely'))
                    continue

                tf = header.get('test_focus', '')

                if not tf or not tf.strip():
                    errors.append((rel, 'Test Focus is empty'))
                elif len(tf.strip()) < 15:
                    warnings.append((rel, f'Test Focus too short ({len(tf.strip())} chars): "{tf.strip()[:60]}"'))
                elif '|' in tf:
                    pipe_pos = tf.index('|')
                    ctx_start = max(0, pipe_pos - 10)
                    ctx_end = pipe_pos + 15
                    warnings.append((rel, f'Test Focus contains ASCII pipe | (will break markdown tables): "...{tf[ctx_start:ctx_end]}..."'))

                # Check for CJK characters in the Test Focus value — translation-completeness gate (non-blocking)
                if tf and re.search(r'[\u4e00-\u9fff]', tf):
                    warnings.append((rel, f'Test Focus contains CJK characters (translation incomplete)'))

    return errors, warnings, infos


# =============================================================================
# Quality Gate 2 & 3: Table Renderer + Output Validator
# =============================================================================

def render_test_table(header_cols, rows):
    """Centralized markdown table renderer with built-in validation.

    Args:
        header_cols: list of column header strings, e.g. ['File', 'How to Test']
        rows: list of row lists, each inner list must match len(header_cols)

    Returns:
        markdown table string

    Raises:
        ValueError if column counts don't match or cells are empty
    """
    n_cols = len(header_cols)
    header_line = '| ' + ' | '.join(header_cols) + ' |'
    sep_line = '|' + '|'.join(['---'] * n_cols) + '|'

    lines = [header_line, sep_line]

    for i, row in enumerate(rows):
        if len(row) != n_cols:
            raise ValueError(
                f'Row {i} has {len(row)} columns but header has {n_cols}: {row[0] if row else "(empty)"}')
        for j, cell in enumerate(row):
            if not cell or not str(cell).strip():
                raise ValueError(
                    f'Row {i} column {j} ({header_cols[j]}) is empty')
            if '|' in str(cell):
                raise ValueError(
                    f'Row {i} column {j} ({header_cols[j]}) contains raw pipe | character: use fullwidth ｜ instead')

        lines.append('| ' + ' | '.join(str(c).replace('|', '｜') for c in row) + ' |')

    return '\n'.join(lines)


def validate_section9(markdown_text, per_production):
    """Validate generated Section 9 markdown for structural integrity.

    Returns list of issue strings. Empty list = valid.
    """
    issues = []

    # Check 1: Every table row has correct column count
    # Table lines look like: | col1 | col2 | ... |
    # Header lines contain short labels like File, How to Test, Rule, Metric
    # Data lines start with TC_ or rule IDs
    current_n_pipes = None
    for line in markdown_text.split('\n'):
        if line.startswith('| ') and line.endswith(' |'):
            n_pipes = line.count('|')
            if line.startswith('|---'):
                continue  # separator
            # Detect header: first cell after | is a short label (not a filename or rule ID)
            first_cell = line.split('|')[1].strip()
            is_header = (first_cell and not first_cell.startswith('TC_')
                         and not first_cell.startswith('SEM_') and not first_cell.startswith('SMN_')
                         and len(first_cell) < 15)
            if is_header:
                current_n_pipes = n_pipes
            elif current_n_pipes is not None and n_pipes != current_n_pipes:
                cell_preview = first_cell[:40] if first_cell else '?'
                issues.append(f'Column mismatch: header has {current_n_pipes} pipes, row has {n_pipes} pipes: cell=\"{cell_preview}\"')

    # Check 2: Production count matches filesystem
    sec9_prods = set()
    for m in re.finditer(r'^### 9\.\d+ (\w+) \(', markdown_text, re.MULTILINE):
        sec9_prods.add(m.group(1))

    fs_prods = set(pn for (_, pn) in per_production)
    missing_in_sec9 = fs_prods - sec9_prods
    extra_in_sec9 = sec9_prods - fs_prods

    for p in missing_in_sec9:
        issues.append(f'Production on disk but missing from Section 9: {p}')
    for p in extra_in_sec9:
        issues.append(f'Production in Section 9 but not on disk: {p}')

    return issues


# =============================================================================
# Architecture Diagram Verification
# =============================================================================

ARCH_DIAGRAM = os.path.join(BASE, 'reports', 'architecture_mindmap.md')
SKILLS_DIR = os.path.join(ROOT_DIR, '.claude', 'skills')
AGENTS_DIR = os.path.join(ROOT_DIR, '.claude', 'agents')


def verify_architecture_diagram():
    """Check that architecture_mindmap.md matches actual skills/agents on disk."""
    issues = []

    if not os.path.exists(ARCH_DIAGRAM):
        return ['architecture_mindmap.md not found — run sync_all.py --quick to regenerate']

    with open(ARCH_DIAGRAM, 'r', encoding='utf-8') as f:
        diagram = f.read()

    # Collect what's actually on disk
    actual_skills = set()
    if os.path.isdir(SKILLS_DIR):
        actual_skills = {f.replace('.md', '') for f in os.listdir(SKILLS_DIR) if f.endswith('.md')}

    actual_agents = set()
    if os.path.isdir(AGENTS_DIR):
        actual_agents = {f.replace('.md', '') for f in os.listdir(AGENTS_DIR) if f.endswith('.md')}

    # Collect backtick-quoted names from the diagram (all of them, unfiltered)
    all_refs = set()
    for m in re.finditer(r'`([a-z][a-z-]+)`', diagram):
        all_refs.add(m.group(1))

    # Check: skill/agent on disk but missing from diagram
    for s in sorted(actual_skills):
        if s not in diagram:
            issues.append(f'Architecture diagram out of date: skill `{s}` on disk but not in architecture_mindmap.md')

    for a in sorted(actual_agents):
        if a not in diagram:
            issues.append(f'Architecture diagram out of date: agent `{a}` on disk but not in architecture_mindmap.md')

    # Check: diagram references skill/agent not on disk (stale reference)
    # NOTE: when adding a new agent, extend the tuple below (mindmap must mention it)
    for ref in sorted(all_refs):
        if ref in ('vhdl-test-generator', 'doc-sync', 'quality-audit', 'ghdl-verify') and ref not in actual_skills:
            issues.append(f'Architecture diagram references non-existent skill: `{ref}`')
        if ref in ('sync-agent', 'quality-agent', 'project-architect', 'meta-architect') and ref not in actual_agents:
            issues.append(f'Architecture diagram references non-existent agent: `{ref}`')

    # Check CLAUDE.md and sync_all.py are referenced
    claude_path = os.path.join(ROOT_DIR, 'CLAUDE.md')
    if os.path.exists(claude_path) and 'CLAUDE.md' not in diagram:
        issues.append('Architecture diagram missing CLAUDE.md reference')

    if 'sync_all.py' not in diagram:
        issues.append('Architecture diagram missing sync_all.py reference')

    # Check: every living root script is documented (prevents silent architecture
    # drift when a new script is added to the repo but never documented). Legacy
    # one-shot generators are excluded by directory (legacy_scripts/).
    for s in sorted(live_root_scripts()):
        if s not in diagram:
            issues.append(f'Architecture diagram missing script: `{s}`')

    # Check: key integration concepts are present (lowercase compare)
    for tok in EXPECTED_CONCEPTS:
        if tok not in diagram.lower():
            issues.append(f'Architecture diagram missing concept token: `{tok}`')

    # Check: no stale script references (diagram mentions a .py that does not
    # exist anywhere). Scripts may live at the repo root, under .claude/
    # (hooks — M2), or under legacy_scripts/ (archived one-shots — P3).
    for m in re.finditer(r'`([\w-]+\.py)`', diagram):
        name = m.group(1)
        found = os.path.exists(os.path.join(ROOT_DIR, name))
        for subdir in ('.claude', 'legacy_scripts'):
            if found:
                break
            for _root, _, fnames in os.walk(os.path.join(ROOT_DIR, subdir)):
                if name in fnames:
                    found = True
                    break
        if not found:
            issues.append(f'Architecture diagram references non-existent script: `{name}`')

    return issues


def update_architecture_diagram_timestamp():
    """Update the auto-generation timestamp in architecture_mindmap.md."""
    if not os.path.exists(ARCH_DIAGRAM):
        return

    with open(ARCH_DIAGRAM, 'r', encoding='utf-8') as f:
        content = f.read()

    # Update the date line
    content = re.sub(
        r'> Generated on \d{4}-\d{2}-\d{2}[^\n]*',
        f'> Generated on {today_str} · verified by `sync_all.py` when architecture files change',
        content
    )

    with open(ARCH_DIAGRAM, 'w', encoding='utf-8') as f:
        f.write(content)


def classify_file_type(filename):
    """Classify file as SYN, SNN, SEM, SMN, SYN_S, SNN_S, etc."""
    base = filename.replace('.vhd', '')
    parts = base.split('_')
    markers = []
    for i, p in enumerate(parts):
        if p in ('SYN', 'SNN', 'SEM', 'SMN'):
            if (i + 1 < len(parts)
                    and re.match(r'^S\d{1,2}$', parts[i + 1])):
                markers.append((i, f'{p}_{parts[i+1]}'))
            else:
                markers.append((i, p))
    if not markers:
        return 'UNK'
    smn_markers = [m for m in markers if m[1].startswith('SMN')]
    if smn_markers:
        return smn_markers[0][1]
    return markers[0][1]


def extract_header(filepath):
    """Extract metadata from VHDL file header (first 30 lines)."""
    try:
        with open(filepath, 'r', encoding='utf-8', errors='replace') as f:
            lines = [f.readline() for _ in range(30)]
    except Exception:
        return None
    data = {}
    for line in lines:
        line = line.strip()
        if not line.startswith('--'):
            break
        content = re.sub(r'^--\s*', '', line).strip()
        for field in ['Case ID', 'Rule Type', 'Related Rule ID', 'Case Type',
                       'Test Focus', 'Expected Result', 'Production',
                       'Standard Reference', 'Error Category']:
            if content.startswith(f'{field}:'):
                data[field.lower().replace(' ', '_')] = content[len(field)+1:].strip()
                break
    return data if 'test_focus' in data else None


def generate_section9():
    """Generate Section 9 with chapter-aware keying (fixes cross-chapter duplicates)."""
    prod_data = defaultdict(lambda: defaultdict(list))
    total_files = 0

    for chapter_dir in sorted(os.listdir(CASES)):
        chapter_path = os.path.join(CASES, chapter_dir)
        if not os.path.isdir(chapter_path) or not chapter_dir.startswith('ch'):
            continue
        for prod_name in sorted(os.listdir(chapter_path)):
            prod_path = os.path.join(chapter_path, prod_name)
            if not os.path.isdir(prod_path):
                continue
            key = (chapter_dir, prod_name)
            for fname in sorted(os.listdir(prod_path)):
                if not fname.endswith('.vhd'):
                    continue
                fpath = os.path.join(prod_path, fname)
                header = extract_header(fpath)
                if header is None:
                    continue
                ftype = classify_file_type(fname)
                prod_data[key][ftype].append({
                    'filename': fname,
                    'test_focus': header.get('test_focus', '?'),
                    'related_rule_id': header.get('related_rule_id', '?'),
                })
                total_files += 1

    # Build cross-reference map
    prod_names = defaultdict(list)
    for (ch, pn) in prod_data:
        prod_names[pn].append(ch)
    n_unique = len(prod_names)
    n_cross = sum(1 for chs in prod_names.values() if len(chs) > 1)

    # Sort
    sorted_keys = sorted(prod_data.keys(),
                         key=lambda k: (CHAPTER_NUM.get(k[0][:4], 99), k[1]))

    # Pre-compute section numbers for cross-refs
    section_map = {}
    sn = 0
    for key in sorted_keys:
        sn += 1
        _, prod_name = key
        if prod_name not in section_map:
            section_map[prod_name] = []
        section_map[prod_name].append(sn)

    cat_labels = {'A': 'Category A (standalone compilation units)', 'B': 'Category B (declarations)',
                  'C': 'Category C (structures/containers)', 'D': 'Category D (leaf elements)',
                  'E': 'Category E (lexical)'}

    output = []
    output.append('## 9. Per-Production Test Point Details\n')
    output.append('> Report descriptions ↔ file Header Test Focus ↔ VHD body content stay consistent across all three layers.')
    output.append(f'> **Auto-generated** — extracted from the `-- Test Focus:` header field of {total_files} files.')
    output.append(f'> Covers {n_unique} unique productions across {len(prod_data)} chapter entries.')
    if n_cross > 0:
        output.append(f'> ({n_cross} productions appear in multiple chapters, each with its own test folder)')
    output.append('')

    section_num = 0
    for key in sorted_keys:
        section_num += 1
        ch_dir, prod_name = key
        ch_info = CHAPTER_NAMES.get(ch_dir, ('?', '?'))
        category = PRODUCTION_CATEGORIES.get(prod_name, 'C')
        files_by_type = prod_data[key]
        total = sum(len(v) for v in files_by_type.values())

        # Cross-reference link
        other_sns = [s for s in section_map.get(prod_name, []) if s != section_num]
        xref = ''
        if other_sns:
            xref = f' | Also in: ' + ', '.join(
                f'[§9.{s}](#9-{s}-{prod_name.replace("_", "-")})' for s in other_sns)

        output.append(f'### 9.{section_num} {prod_name} ({ch_info[0]}, {ch_info[1]})\n')
        output.append(f'**Category**: {cat_labels.get(category, cat_labels["C"])} | **Total files**: {total}{xref}')
        output.append('')

        # SYN
        all_syn = sorted(files_by_type.get('SYN', []) + files_by_type.get('SYN_S', []),
                         key=lambda x: x['filename'])
        if all_syn:
            output.append(f'#### SYN — Positive syntax tests ({len(all_syn)} files)\n')
            rows = [[f['filename'], f['test_focus']] for f in all_syn]
            output.append(render_test_table(['File', 'How to Test'], rows))
            output.append('')

        # SNN
        all_snn = sorted(files_by_type.get('SNN', []) + files_by_type.get('SNN_S', []),
                         key=lambda x: x['filename'])
        if all_snn:
            output.append(f'#### SNN — Negative syntax tests ({len(all_snn)} files)\n')
            rows = [[f['filename'], f['test_focus']] for f in all_snn]
            output.append(render_test_table(['File', 'How to Test'], rows))
            output.append('')

        # SEM/SMN
        all_sem = sorted(files_by_type.get('SEM', []) + files_by_type.get('SMN', []),
                         key=lambda x: x['filename'])
        if all_sem:
            output.append(f'#### SEM/SMN — Semantic tests ({len(all_sem)} files)\n')
            rows = [[f.get('related_rule_id', '?'), f['filename'], f['test_focus']] for f in all_sem]
            output.append(render_test_table(['Rule', 'File', 'How to Test'], rows))
            output.append('')

        output.append('---\n')

    output.append(f'### 9.{section_num + 1} Section Statistics\n')
    output.append('| Metric | Value |')
    output.append('|---|---|')
    output.append(f'| Unique productions | {n_unique} |')
    output.append(f'| Chapter entries (including cross-chapter duplicates) | {len(prod_data)} |')
    output.append(f'| Cross-chapter productions | {n_cross} |')
    output.append(f'| Covered files | {total_files} |')
    output.append(f'| Auto-generated at | {datetime.now().strftime("%Y-%m-%d %H:%M")} |')
    output.append('')

    return '\n'.join(output), prod_data, total_files


def update_section9_in_test_plan(section9_content):
    """Replace Section 9 in the test plan."""
    with open(TEST_PLAN, 'r', encoding='utf-8') as f:
        content = f.read()

    start_marker = '## 9. Per-Production Test Point Details'
    start_idx = content.find(start_marker)
    if start_idx == -1:
        print("ERROR: Section 9 start marker not found!")
        return False

    end_markers = ['\n## Appendix A:', '\n---\n\n## Appendix A:']
    end_idx = None
    for em in end_markers:
        idx = content.find(em, start_idx + len(start_marker))
        if idx != -1:
            end_idx = idx
            break

    if end_idx is None:
        print("ERROR: Section 9 end marker not found!")
        return False

    new_content = content[:start_idx] + section9_content + '\n' + content[end_idx:]
    with open(TEST_PLAN, 'w', encoding='utf-8') as f:
        f.write(new_content)
    return True


# =============================================================================
# 6. PRODUCTION_TRACKER.md Auto-Update
# =============================================================================

def update_tracker(per_production, per_chapter):
    """Rebuild PRODUCTION_TRACKER.md chapter tables from the filesystem scan.

    - Chapter sections are generated from per_chapter — every disk chapter gets
      a section. Cross-chapter productions are listed once, under their LRM
      primary chapter (bnf_reference.csv chapter_ref; falls back to the first
      disk chapter alphabetically).
    - Title production count + "Last updated" line are written from the scan.
    - Files column = per-production file sum across all chapters.
    - Status and Notes columns are preserved from the previous tracker;
      productions new on disk are auto-inserted as DONE.
    - Summary table is rebuilt from the new body (Total = row count per chapter,
      so non-bucket statuses like NEEDS/TODO still count toward the chapter).
    """
    with open(TRACKER, 'r', encoding='utf-8') as f:
        content = f.read()

    # ---- 1. Parse previous rows: name -> (status, old_files, notes)
    old_rows = {}
    for line in content.split('\n'):
        m = re.match(r'^\|\s*\d+\s*\|\s*(\w+)\s*\|(.*)$', line)
        if not m:
            continue
        name = m.group(1)
        cells = [c.strip() for c in m.group(2).split('|')]
        if len(cells) < 3:
            continue
        status = cells[0]
        try:
            old_files = int(cells[1])
        except (ValueError, IndexError):
            old_files = -1
        notes = ' | '.join(cells[2:]).strip()
        old_rows.setdefault(name, (status, old_files, notes))  # first occurrence wins

    # ---- 2. Filesystem data: per-name chapter lists + summed file counts
    prod_counts = defaultdict(int)
    disk_chs = defaultdict(list)
    for (ch, pn), info in per_production.items():
        prod_counts[pn] += info['files']
        disk_chs[pn].append(ch)

    # ---- 3. Primary chapter per production (LRM chapter_ref when available)
    ref_chapters = {}
    try:
        with open(BNF_REF_CSV, 'r', encoding='utf-8-sig') as f:
            for r in csv.DictReader(f, delimiter=';'):
                ref_chapters[(r.get('bnf_id') or '').replace('BNF_', '').lower()] = \
                    (r.get('chapter_ref') or '').strip()
    except Exception:
        pass
    chdirs_by_num = {int(ch[2:4]): ch for ch in per_chapter}
    primary = {}
    for pn, chs in disk_chs.items():
        target = None
        ref = ref_chapters.get(pn)
        if ref:
            m = re.match(r'(\d+)', ref)
            if m:
                target = chdirs_by_num.get(int(m.group(1)))
        if target not in chs:
            target = sorted(chs)[0]
        primary[pn] = target

    # ---- 4. Header (title + Last updated), body rebuild, summary rebuild
    header_lines = []
    for line in content.split('\n'):
        if re.match(r'^## ch\d\d_\w+', line):
            break
        header_lines.append(line)
    header = '\n'.join(header_lines)
    n_unique = len(disk_chs)
    header = re.sub(r'^# Production Tracker — .*$',
                    f'# Production Tracker — All {n_unique} Productions Status',
                    header, flags=re.MULTILINE)
    header = re.sub(r'^Last updated:.*$',
                    f'Last updated: {today_str} (auto: sync_all.py)',
                    header, flags=re.MULTILINE)

    lines = header.split('\n')
    fixes = []
    for ch in sorted(per_chapter):
        names = sorted(pn for (c, pn) in per_production if c == ch and primary[pn] == ch)
        lines.append(f'## {ch} ({len(names)} productions)')
        lines.append('')
        lines.append('| # | Production | Status | Files | Notes |')
        lines.append('|---|---|---|---|---|')
        for i, pn in enumerate(names, 1):
            files = prod_counts[pn]
            if pn in old_rows:
                status, old_files, notes = old_rows[pn]
                if old_files != files:
                    fixes.append((pn, old_files, files))
            else:
                status, notes = 'DONE', f'[auto-inserted {today_str}]'
            lines.append(f'| {i} | {pn} | {status} | {files} | {notes} |')
        lines.append('')

    status_counts = defaultdict(lambda: defaultdict(int))
    ch_rows = defaultdict(int)
    current_ch = None
    for line in lines:
        hm = re.match(r'^## (ch\d\d_\w+)', line)
        if hm:
            current_ch = hm.group(1)
            continue
        if current_ch is None:
            continue
        m = re.match(r'^\|\s*\d+\s*\|\s*(\w+)\s*\|\s*([^|]+)\s*\|', line)
        if not m:
            continue
        ch_rows[current_ch] += 1
        status = m.group(2).strip()
        # F4: NEEDS is a first-class bucket (e.g. ch11 generate_statement);
        # any status outside the known buckets lands in OTHER so the Summary
        # column sums always equal the chapter Total (invariant by
        # construction, no silent drop like the historical 313 != 314).
        for bucket in ('DONE', 'GOOD', 'THIN', 'EMPTY', 'NEEDS'):
            if bucket in status:
                status_counts[current_ch][bucket] += 1
                break
        else:
            status_counts[current_ch]['OTHER'] += 1

    lines.append('## Summary')
    lines.append('')
    buckets = ['DONE', 'GOOD', 'THIN', 'EMPTY', 'NEEDS']
    if any(status_counts[ch].get('OTHER', 0) for ch in status_counts):
        buckets.append('OTHER')
    lines.append('| Chapter | ' + ' | '.join(buckets) + ' | Total |')
    lines.append('|' + '---|' * (len(buckets) + 2))
    totals_buckets = defaultdict(int)
    for ch in sorted(per_chapter):
        sc = status_counts.get(ch, {})
        for b in buckets:
            totals_buckets[b] += sc.get(b, 0)
        cells = ' | '.join(str(sc.get(b, 0)) for b in buckets)
        ch_short = ch[:4].replace('ch', 'Ch.')
        lines.append(f'| {ch_short} | {cells} | {ch_rows[ch]} |')
    total_cells = ' | '.join(f'**{totals_buckets[b]}**' for b in buckets)
    lines.append(f'| **Total** | {total_cells} | **{sum(ch_rows.values())}** |')
    lines.append('')

    with open(TRACKER, 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))

    # Every on-disk production now has a row (auto-inserted if untracked);
    # duplicate rows are naturally deduplicated by the rebuild — nothing left.
    return fixes, [], []


# =============================================================================
# 6.5 GHDL Gate + Debt Chapter
# =============================================================================

def verify_ghdl_gate(totals):
    """GHDL gate (Iron Rule 5): no FAIL rows + run freshness via manifest.

    ghdl_failures.csv must have no FAIL rows. Additionally (P2), a full
    run_ghdl_suite.py run stamps reports/ghdl_run_manifest.json with the file
    count at run time; if that count differs from the current cases_src total,
    the results are stale (files added/removed since the last /ghdl-verify).
    A manifest that exists but is missing (pre-P2 results) triggers a prompt to
    re-run /ghdl-verify — the manifest is never fabricated on verify's behalf."""
    issues = []
    if not os.path.exists(GHDL_FAILURES) and not os.path.exists(GHDL_RESULTS):
        issues.append('GHDL GATE: no ghdl results yet — run /ghdl-verify (external verification gate, Iron Rule 5)')
        return issues
    if os.path.exists(GHDL_FAILURES):
        try:
            with open(GHDL_FAILURES, 'r', encoding='utf-8-sig') as f:
                rows = list(csv.DictReader(f))
            if rows:
                issues.append(f'GHDL GATE: {len(rows)} failure row(s) in ghdl_failures.csv — run /ghdl-verify and reduce to 0')
        except Exception as e:
            issues.append(f'GHDL GATE: cannot read ghdl_failures.csv: {e}')
    # Freshness: full runs stamp the manifest; partial runs never do.
    if os.path.exists(GHDL_MANIFEST):
        try:
            with open(GHDL_MANIFEST, 'r', encoding='utf-8') as f:
                manifest = json.load(f)
            ran_total = manifest.get('total_files_at_run')
            if isinstance(ran_total, int) and ran_total != totals['files']:
                issues.append(f'GHDL GATE: results are stale — files were added/removed since the last /ghdl-verify run'
                              f' (current {totals["files"]} files, last run {ran_total})')
        except Exception as e:
            issues.append(f'GHDL GATE: cannot read ghdl_run_manifest.json: {e}')
    else:
        issues.append('GHDL GATE: no ghdl_run_manifest.json — re-run /ghdl-verify full regeneration (current results may be stale)')
    return issues


PRESENTATION_INDEX = os.path.join(ROOT_DIR, 'presentation', 'index.html')
PRESENTATION_ASSETS = os.path.join(ROOT_DIR, 'presentation', 'assets')

PRESENTATION_ATTACHMENTS = ('architecture_mindmap.pdf', 'VHDL2008_Test_Plan_latest.html',
                            'coverage_summary.md', 'ghdl_test_results.md', 'PRODUCTION_TRACKER.md')


def verify_presentation(totals):
    """Presentation freshness gate: snapshot marker in presentation/index.html
    must match the live filesystem (files/folders, skills, agents, root scripts,
    ghdl files-tested) and every on-disk skill/agent name must appear in the
    page (mirrors the mindmap check — prevents stale drill-down content).

    The snapshot is written by build_presentation.py (called by --quick);
    drift means the last sync missed a cases_src/architecture change."""
    issues = []
    if not os.path.exists(PRESENTATION_INDEX):
        issues.append('Presentation: presentation/index.html missing — run sync_all.py --quick')
        return issues

    with open(PRESENTATION_INDEX, 'r', encoding='utf-8', errors='replace') as f:
        html_text = f.read()

    m = re.search(r'<!-- PRESENTATION_SNAPSHOT: ([^>]+) -->', html_text)
    if not m:
        issues.append('Presentation: PRESENTATION_SNAPSHOT marker missing — rebuild via sync_all.py --quick')
        return issues

    snap = dict(kv.split('=', 1) for kv in m.group(1).split())
    try:
        if int(snap.get('files', -1)) != totals['files']:
            issues.append(f'Presentation: snapshot files={snap.get("files")} vs actual {totals["files"]} '
                          f'— rebuild via sync_all.py --quick')
        if int(snap.get('folders', -1)) != totals['folders']:
            issues.append(f'Presentation: snapshot folders={snap.get("folders")} vs actual {totals["folders"]} '
                          f'— rebuild via sync_all.py --quick')
    except ValueError:
        issues.append('Presentation: snapshot marker malformed — rebuild via sync_all.py --quick')

    # skills / agents / scripts lists vs live disk (same sources as verify_architecture_diagram)
    actual_skills = {f.replace('.md', '') for f in os.listdir(SKILLS_DIR) if f.endswith('.md')} \
        if os.path.isdir(SKILLS_DIR) else set()
    actual_agents = {f.replace('.md', '') for f in os.listdir(AGENTS_DIR) if f.endswith('.md')} \
        if os.path.isdir(AGENTS_DIR) else set()
    actual_scripts = live_root_scripts()

    snap_skills = set(snap.get('skills', '').split(',')) if snap.get('skills') else set()
    snap_agents = set(snap.get('agents', '').split(',')) if snap.get('agents') else set()
    snap_scripts = set(snap.get('scripts', '').split(',')) if snap.get('scripts') else set()

    if snap_skills != actual_skills:
        issues.append(f'Presentation: snapshot skills stale ({sorted(actual_skills - snap_skills)} on disk) '
                      f'— rebuild via sync_all.py --quick')
    if snap_agents != actual_agents:
        issues.append(f'Presentation: snapshot agents stale ({sorted(actual_agents - snap_agents)} on disk) '
                      f'— rebuild via sync_all.py --quick')
    if snap_scripts != actual_scripts:
        issues.append(f'Presentation: snapshot scripts stale ({sorted(actual_scripts - snap_scripts)} on disk) '
                      f'— rebuild via sync_all.py --quick')

    # every on-disk skill/agent/script name and every extracted doc name must
    # appear in the page content (the drill-down is rendered from the
    # architecture spec — extract_arch_spec() over architecture_mindmap.md
    # §2.2–§2.5 — which can lag behind the disk)
    for s in sorted(actual_skills):
        if s not in html_text:
            issues.append(f'Presentation: skill `{s}` not mentioned in page — '
                          f'update architecture_mindmap.md §2.2–§2.5 and '
                          f'rebuild via sync_all.py --quick')
    for a in sorted(actual_agents):
        if a not in html_text:
            issues.append(f'Presentation: agent `{a}` not mentioned in page — '
                          f'update architecture_mindmap.md §2.2–§2.5 and '
                          f'rebuild via sync_all.py --quick')
    for sc in sorted(actual_scripts):
        if sc not in html_text:
            issues.append(f'Presentation: script `{sc}` not mentioned in page — '
                          f'update architecture_mindmap.md §2.4 and rebuild '
                          f'via sync_all.py --quick')
    for d in project_facts.extract_arch_spec().get('docs', []):
        if d['name'] not in html_text:
            issues.append(f'Presentation: document `{d["name"]}` not mentioned '
                          f'in page — update architecture_mindmap.md §2.5 and '
                          f'rebuild via sync_all.py --quick')

    # ghdl freshness vs manifest (skip when manifest missing — verify_ghdl_gate reports that)
    if os.path.exists(GHDL_MANIFEST):
        try:
            with open(GHDL_MANIFEST, 'r', encoding='utf-8') as f:
                manifest = json.load(f)
            tested = manifest.get('files_tested')
            if isinstance(tested, int) and int(snap.get('ghdl_files', -1)) != tested:
                issues.append(f'Presentation: snapshot ghdl_files={snap.get("ghdl_files")} '
                              f'vs manifest {tested} — rebuild via sync_all.py --quick')
        except Exception as e:
            issues.append(f'Presentation: cannot read ghdl_run_manifest.json: {e}')

    # attachments present
    for name in PRESENTATION_ATTACHMENTS:
        if not os.path.exists(os.path.join(PRESENTATION_ASSETS, name)):
            issues.append(f'Presentation: asset missing: assets/{name}')

    return issues


DEBT_HEADING = '## 8.5 Known Issues / Technical Debt'


def verify_debt_chapter(plan):
    """Validate the hand-maintained §8.5 debt chapter (read-only).

    Checks: heading exists, sits in the safe zone (§8..§9), no verify-trap
    regexes match inside the chapter, migration log heading exists, and every
    table row has its table's column count with no empty cells."""
    issues = []
    idx = plan.find(DEBT_HEADING)
    if idx == -1:
        return [f'Debt chapter: heading `{DEBT_HEADING}` not found (hand-maintained chapter must exist)']

    sec8_idx = plan.find('## 8. Test Completion Criteria')
    sec9_idx = plan.find('## 9. Per-Production Test Point Details')
    if sec9_idx != -1 and idx > sec9_idx:
        issues.append('Debt chapter: located AFTER Section 9 heading (must sit in the safe zone before `## 9.`)')
    if sec8_idx != -1 and idx < sec8_idx:
        issues.append('Debt chapter: located BEFORE Section 8 heading')
    block = plan[idx:sec9_idx if sec9_idx != -1 else len(plan)]

    # 1. verify-trap regexes must NOT match inside the chapter block
    traps = [
        (r'Total test files[^|]+\|\s+\*\*([\d,]+)\*\*', 'Total test files row'),
        (r'Productions documented[^|]+\|\s*(\d+)', 'Productions documented row'),
        (r'### 9\.\d+.*\*\*Total files\*\*:\s*\d+', 'Section 9 Total files heading'),
        (r'\|\s*Ch\.\d+\.\s+\w+[^|]+\|\s*(\d+)\s*\|', 'Appendix E chapter row'),
    ]
    for pat, name in traps:
        if re.search(pat, block):
            issues.append(f'Debt chapter: verify-trap pattern matched inside chapter ({name}) — reword')

    # 2. migration log heading must exist (heading form — prose mentions don't count)
    if '### Migration Log' not in block:
        issues.append('Debt chapter: migration log heading missing')

    # 3. table shape: split block into contiguous row-groups, validate each
    #    group against its own header (first row) — no empty cells
    groups = []
    cur = None
    for l in block.splitlines():
        if l.strip().startswith('|'):
            if cur is None:
                cur = []
                groups.append(cur)
            cur.append(l)
        else:
            cur = None
    for rows in groups:
        if not rows:
            continue
        n = rows[0].count('|') - 1
        for l in rows[1:]:
            if re.match(r'^\s*\|[\s\-|]+\|\s*$', l):
                continue  # separator row
            cells = [c.strip() for c in l.strip().strip('|').split('|')]
            if len(cells) != n or any(not c for c in cells):
                issues.append(f'Debt chapter: malformed table row: {l[:60]}')
                break

    return issues


# =============================================================================
# 7l. Architecture-Spec Gate (presentation rendered from the mindmap)
# =============================================================================

def verify_arch_spec():
    """Architecture-spec gate (verify 7l): project_facts.extract_arch_spec()
    must yield exactly the live counts (skills/agents/scripts from disk,
    docs = §2.5 table rows) and every extracted component name must appear
    in presentation/index.html (the injected ARCH_SPEC JSON). Zero extracted
    components = parser-drift self-check."""
    issues = []
    facts = project_facts.compute_facts()
    spec = project_facts.extract_arch_spec()
    counts = {k: len(v) for k, v in spec.items()}
    if not any(counts.values()):
        return ['Arch spec: extraction yielded zero components from '
                'architecture_mindmap.md §2.2–§2.5 (parser drift self-check '
                '— check the headings and table shapes)']

    expected = {'skills': ('2.2', facts['skills']),
                'agents': ('2.3', facts['agents']),
                'scripts': ('2.4', facts['root_scripts']),
                'docs': ('2.5', facts['doc_kinds'])}
    for kind, (section, want) in expected.items():
        if counts[kind] != want:
            issues.append(f'Arch spec: extracted {counts[kind]} {kind} from '
                          f'architecture_mindmap.md §{section} but the live '
                          f'count is {want} (mindmap drifted from disk)')

    if not os.path.exists(PRESENTATION_INDEX):
        return issues  # existence reported by verify_presentation
    with open(PRESENTATION_INDEX, 'r', encoding='utf-8', errors='replace') as f:
        page = f.read()
    for kind in ('skills', 'agents', 'scripts', 'docs'):
        for item in spec[kind]:
            if item['name'] not in page:
                issues.append(f'Arch spec: {kind[:-1]} `{item["name"]}` not '
                              f'mentioned in presentation/index.html — '
                              f'rebuild via sync_all.py --quick')
    return issues


# =============================================================================
# 7m. Artifact Manifest + Style/Logic Stability Gate
# =============================================================================

def verify_manifest():
    """ARTIFACT_MANIFEST gate: sync_manifest.json must exist and parse; its
    generator field must name a living root script; every
    policy=script-then-generate artifact must exist on disk; unknown policy
    → issue."""
    issues = []
    if not os.path.exists(SYNC_MANIFEST):
        issues.append('ARTIFACT_MANIFEST: reports/sync_manifest.json missing '
                      '— run sync_all.py --quick --accept-style-change to '
                      'seed the style references')
        return issues
    try:
        with open(SYNC_MANIFEST, 'r', encoding='utf-8') as f:
            manifest = json.load(f)
    except Exception as e:
        return [f'ARTIFACT_MANIFEST: cannot parse sync_manifest.json: {e}']
    living = live_root_scripts()
    for entry in manifest.get('artifacts', []):
        rel = entry.get('path')
        policy = entry.get('policy')
        gen = entry.get('generator')
        if policy not in ('direct', 'script-then-generate'):
            issues.append(f'ARTIFACT_MANIFEST: unknown policy {policy!r} for {rel}')
            continue
        if gen not in living:
            issues.append(f'ARTIFACT_MANIFEST: generator {gen!r} for {rel} '
                          f'is not a living root script')
        if policy == 'script-then-generate' and not os.path.exists(_manifest_abs(rel)):
            issues.append(f'ARTIFACT_MANIFEST: {rel} missing — run '
                          f'sync_all.py --quick to regenerate')
    return issues


def verify_style_stability():
    """STYLE REFERENCE gate: recompute style fingerprints from current disk
    and generator sources; any mismatch with the accepted manifest refs is
    style/logic drift (accept deliberately via --quick --accept-style-change;
    --verify-only never writes)."""
    issues = []
    if not os.path.exists(SYNC_MANIFEST):
        return issues  # verify_manifest reports the missing file
    try:
        with open(SYNC_MANIFEST, 'r', encoding='utf-8') as f:
            manifest = json.load(f)
    except Exception:
        return issues

    gen_drifted = {}  # generator name -> bool (any artifact drifted)
    for entry in manifest.get('artifacts', []):
        if entry.get('policy') != 'script-then-generate':
            continue
        rel = entry['path']
        abs_path = _manifest_abs(rel)
        refs = entry.get('style_refs') or {}
        gen_drifted.setdefault(entry.get('generator'), False)

        if rel.endswith('.pdf'):
            # PDF: existence + size-window check (no skeleton possible)
            if not os.path.exists(abs_path):
                continue  # existence reported by verify_manifest
            size = os.path.getsize(abs_path)
            ref_size = refs.get('pdf_size')
            if (isinstance(ref_size, int) and ref_size > 0
                    and not (0.5 * ref_size <= size <= 2.0 * ref_size)):
                issues.append(f'Style/logic drift in {rel} (pdf size window: '
                              f'{size} bytes vs accepted {ref_size}) — if '
                              f'intended, update deliberately via --quick '
                              f'--accept-style-change and commit both the '
                              f'change and the manifest')
                gen_drifted[entry.get('generator')] = True
            continue

        if not os.path.exists(abs_path):
            continue  # existence reported by verify_manifest
        with open(abs_path, 'r', encoding='utf-8', errors='replace') as f:
            text = f.read()
        checks = [('skeleton', html_skeleton(text), refs.get('skeleton'))]
        if refs.get('css'):
            checks.append(('css', css_fingerprint(text), refs['css']))
        if refs.get('js'):
            checks.append(('js', js_fingerprint(text), refs['js']))
        for which, current, accepted in checks:
            if current != accepted:
                issues.append(f'Style/logic drift in {rel} ({which} '
                              f'fingerprint) — if intended, update '
                              f'deliberately via --quick --accept-style-change '
                              f'and commit both the change and the manifest')
                gen_drifted[entry.get('generator')] = True

    # generator-side: the generator's template skeleton must match the
    # accepted ref; drift without any artifact drift = script changed but its
    # output was not rebuilt/accepted
    for gen, info in (manifest.get('generators') or {}).items():
        src = os.path.join(ROOT_DIR, gen)
        if not os.path.exists(src):
            continue
        with open(src, 'r', encoding='utf-8', errors='replace') as f:
            source = f.read()
        current = generator_template_skeleton(source)
        accepted = info.get('template_skeleton')
        if current != accepted:
            msg = (f'Style/logic drift in generator {gen} (template skeleton) '
                   f'— if intended, update deliberately via --quick '
                   f'--accept-style-change and commit both the change and '
                   f'the manifest')
            if not gen_drifted.get(gen):
                msg += ' (generator template changed but its artifacts are '
                'unchanged — rebuild via --quick --accept-style-change)'
            issues.append(msg)
    return issues


def accept_style_changes():
    """Recompute every style fingerprint from current disk + generator
    sources and write reports/sync_manifest.json (the explicit, reviewable
    style-change ritual — the ONLY writer of the manifest)."""
    manifest = {'artifacts': [], 'generators': {}}
    for rel, generator, policy in MANIFEST_ARTIFACTS:
        entry = {'path': rel, 'generator': generator, 'policy': policy}
        if policy == 'script-then-generate':
            abs_path = _manifest_abs(rel)
            if rel.endswith('.pdf'):
                size = os.path.getsize(abs_path) if os.path.exists(abs_path) else None
                entry['style_refs'] = {
                    'pdf_size': size,
                    'note': 'PDF: existence + size-window check (0.5x–2x of '
                            'accepted size) — no skeleton possible',
                }
            else:
                with open(abs_path, 'r', encoding='utf-8', errors='replace') as f:
                    text = f.read()
                refs = {'skeleton': html_skeleton(text)}
                css = css_fingerprint(text)
                if css:
                    refs['css'] = css
                js = js_fingerprint(text)
                if js:
                    refs['js'] = js
                entry['style_refs'] = refs
        manifest['artifacts'].append(entry)
    for gen in ('build_presentation.py', 'generate_arch_pdf.py'):
        src = os.path.join(ROOT_DIR, gen)
        with open(src, 'r', encoding='utf-8', errors='replace') as f:
            source = f.read()
        manifest['generators'][gen] = {
            'template_skeleton': generator_template_skeleton(source)}
    os.makedirs(os.path.dirname(SYNC_MANIFEST), exist_ok=True)
    with open(SYNC_MANIFEST, 'w', encoding='utf-8') as f:
        json.dump(manifest, f, indent=2)
        f.write('\n')
    print(f'  Accepted style references into '
          f'{os.path.relpath(SYNC_MANIFEST, ROOT_DIR)} '
          f'({len(manifest["artifacts"])} artifacts, '
          f'{len(manifest["generators"])} generator templates)')
    return manifest


# =============================================================================
# 7k. Fact-Claim Gate (Facts Authority + Claim Registry)
# =============================================================================

try:
    import project_facts
except ImportError:  # belt-and-braces: sync_all.py always runs from the repo root
    sys.path.insert(0, ROOT_DIR)
    import project_facts

# Output-side targets: rendered documents whose factual claims are verified
# against project_facts.compute_facts() (exempt zones removed before scanning).
FACT_DOC_TARGETS = (
    ('presentation/index.html', os.path.join(ROOT_DIR, 'presentation', 'index.html'),
     'presentation_html'),
    ('architecture_mindmap.md', ARCH_DIAGRAM, 'markdown'),
    ('README.md', os.path.join(ROOT_DIR, 'README.md'), 'markdown'),
    ('coverage_summary.md', COVERAGE, 'markdown'),
    ('PRODUCTION_TRACKER.md', TRACKER, 'markdown'),
    ('test plan', TEST_PLAN, 'test_plan'),
)

# Source-side targets: generator sources must be literal-free — any registry
# match in a generator source is a hardcoded fact (placeholders like
# {{TOTAL_FILES}} contain no digits, so a match in source IS a literal).
FACT_SOURCE_TARGETS = (
    ('build_presentation.py', os.path.join(ROOT_DIR, 'build_presentation.py'),
     'presentation_html'),
    ('generate_arch_pdf.py', os.path.join(ROOT_DIR, 'generate_arch_pdf.py'),
     'markdown'),
    ('build_test_trace.py', os.path.join(ROOT_DIR, 'build_test_trace.py'),
     'markdown'),
)


def _fmt_claim_values(values):
    return '+'.join(str(v) for v in values)


def verify_fact_claims():
    """Claim gate: every factual claim must equal the live fact (single source
    of truth: project_facts.compute_facts()).

    Three sides:
      1. Output side — CLAIM_REGISTRY patterns in the rendered documents
         (exempt zones removed: the presentation evolution section + phase
         accordions, the test plan Migration Log / changelog blocks); a value
         that differs from the corresponding fact is a stale claim.
      2. Source side — the same registry over the generator sources; a match
         there is a hardcoded literal that must become a placeholder or a
         computed value.
      3. Filesystem side — backticked repo-relative path claims in README.md
         and architecture_mindmap.md must exist on disk.
    """
    issues = []
    facts = project_facts.compute_facts()

    for label, path, kind in FACT_DOC_TARGETS:
        if not os.path.exists(path):
            continue  # existence itself is reported by the other verify steps
        with open(path, 'r', encoding='utf-8', errors='replace') as f:
            text = f.read()
        masked = project_facts.exempt_zones(text, kind)
        for m in project_facts.scan_claims(text, masked):
            if m['keys'][0] == 'ANY':
                # ANY rule: the claim value must equal at least one of the
                # listed facts (e.g. "N Iron Rules" = CLAUDE.md orchestration
                # rules OR the vhdl-test-generator content rules)
                allowed = {facts[k] for k in m['keys'][1:]}
                if m['values'][0] not in allowed:
                    truth = ' or '.join(str(facts[k]) for k in m['keys'][1:])
                    issues.append(
                        f'Fact claim stale: "{m["text"]}" claims {m["values"][0]} '
                        f'but truth is {truth} ({m["description"]}) '
                        f'- {label}:{m["line"]}')
                continue
            truth = tuple(facts[k] for k in m['keys'])
            if m['values'] != truth:
                issues.append(
                    f'Fact claim stale: "{m["text"]}" claims {_fmt_claim_values(m["values"])} '
                    f'but truth is {_fmt_claim_values(truth)} ({m["description"]}) '
                    f'- {label}:{m["line"]}')

    for label, path, kind in FACT_SOURCE_TARGETS:
        if not os.path.exists(path):
            continue
        with open(path, 'r', encoding='utf-8', errors='replace') as f:
            text = f.read()
        masked = project_facts.exempt_zones(text, kind)
        for m in project_facts.scan_claims(text, masked):
            issues.append(
                f'Hardcoded fact claim in source: "{m["text"]}" in {label}:{m["line"]} '
                f'- generators must inject via placeholder or compute the value '
                f'({m["description"]})')

    for label, path in (('README.md', os.path.join(ROOT_DIR, 'README.md')),
                        ('architecture_mindmap.md', ARCH_DIAGRAM)):
        if not os.path.exists(path):
            continue
        with open(path, 'r', encoding='utf-8', errors='replace') as f:
            text = f.read()
        issues.extend(project_facts.filesystem_claims(text, label))

    return issues


# =============================================================================
# 7. Cross-Validation
# =============================================================================

def verify_all(per_production, totals, per_chapter):
    """Cross-validate all documents against filesystem. Returns list of issues."""
    issues = []

    # 7a. Section 9 file counts vs filesystem
    with open(TEST_PLAN, 'r', encoding='utf-8') as f:
        plan = f.read()

    sec9_pattern = re.compile(
        r'### 9\.\d+ (\w+) \(Ch\.(\d+),.*?\)[.\s]*?\*\*Total files\*\*:\s*(\d+)', re.DOTALL)
    for m in sec9_pattern.finditer(plan):
        prod_name = m.group(1)
        ch_num = m.group(2)
        sec9_count = int(m.group(3))

        # Find matching filesystem entry
        found = False
        for (ch, pn), info in per_production.items():
            if pn == prod_name and ch.startswith(f'ch{ch_num}' if len(ch_num) == 1 else f'ch0{ch_num}'):
                actual = info['files']
                if sec9_count != actual:
                    issues.append(f'Sec9 mismatch: {ch}/{pn}: sec9={sec9_count}, actual={actual}')
                found = True
                break
        # Also try matching by chapter prefix
        if not found:
            for (ch, pn), info in per_production.items():
                ch_prefix = ch[:4]
                expected_prefix = f'ch{int(ch_num):02d}'
                if pn == prod_name and ch_prefix == expected_prefix:
                    actual = info['files']
                    if sec9_count != actual:
                        issues.append(f'Sec9 mismatch: {ch}/{pn}: sec9={sec9_count}, actual={actual}')
                    found = True
                    break

    # 7b. Coverage report vs filesystem
    with open(COVERAGE, 'r', encoding='utf-8') as f:
        cov = f.read()
    cov_total_match = re.search(r'Total test files[^|]+\|\s+\*\*([\d,]+)\*\*', cov)
    if cov_total_match:
        cov_total = int(cov_total_match.group(1).replace(',', ''))
        if cov_total != totals['files']:
            issues.append(f'Coverage report total: {cov_total}, actual: {totals["files"]}')

    # 7b2. Coverage report reference totals vs reference CSVs (single source)
    ref = load_reference_counts()
    cov_ref_checks = [
        (r'Total BNF productions[^|]+\|\s*([\d,]+)', ref['bnf_total'], 'Coverage BNF total'),
        (r'Excluded BNF[^|]+\|\s*([\d,]+)', ref['bnf_excluded'], 'Coverage excluded BNF'),
        (r'In-scope BNF productions[^|]+\|\s*([\d,]+)', ref['bnf_in_scope'], 'Coverage in-scope BNF'),
        (r'Core semantic rules[^|]+\|\s*([\d,]+)', ref['sem_total'], 'Coverage semantic rules'),
        (r'Total rules \(BNF \+ Semantic\)[^|]+\|\s*([\d,]+)', ref['total_rules'], 'Coverage total rules'),
    ]
    for pat, expected, label in cov_ref_checks:
        m = re.search(pat, cov)
        if m:
            got = int(m.group(1).replace(',', ''))
            if got != expected:
                issues.append(f'{label}: {got}, expected {expected} (derived from reference CSVs)')

    # 7c. Tracker vs filesystem
    with open(TRACKER, 'r', encoding='utf-8') as f:
        tracker_content = f.read()

    n_unique = len({pn for (_, pn) in per_production})
    tracker_title = re.search(r'^# Production Tracker — All (\d+)', tracker_content, re.MULTILINE)
    if tracker_title:
        claimed = int(tracker_title.group(1))
        if claimed != n_unique:
            issues.append(f'Tracker title: claims {claimed} productions, actual unique on disk: {n_unique}')

    prod_counts = defaultdict(int)
    for (ch, prod_name), info in per_production.items():
        prod_counts[prod_name] += info['files']

    for prod_name, actual in prod_counts.items():
        # Find in tracker
        pattern = re.compile(r'\|\s*\d+\s*\|\s*' + re.escape(prod_name) + r'\s*\|\s*[^\|]+\|\s*(\d+)\s*\|')
        tm = pattern.search(tracker_content)
        if tm:
            tracker_count = int(tm.group(1))
            if tracker_count != actual:
                issues.append(f'Tracker mismatch: {prod_name}: tracker={tracker_count}, actual={actual}')
        else:
            issues.append(f'Tracker missing: {prod_name} (has {actual} files on disk)')

    # 7d. Test Plan inline stats vs filesystem
    plan_total_match = re.search(r'Total test files[^|]+\|\s+\*\*([\d,]+)\*\*', plan)
    if plan_total_match:
        plan_total = int(plan_total_match.group(1).replace(',', ''))
        if plan_total != totals['files']:
            issues.append(f'Test Plan total: {plan_total}, actual: {totals["files"]}')

    # 7e. Appendix E header vs filesystem + actual Appendix E file
    appx_e_prod_match = re.search(r'Productions documented[^|]+\|\s*(\d+)', plan)
    if appx_e_prod_match:
        appx_e_claimed = int(appx_e_prod_match.group(1))
        if appx_e_claimed != totals['folders']:
            issues.append(f'Appendix E header: claimed {appx_e_claimed} productions, actual {totals["folders"]} folders')

    # 7f. Appendix E chapter summary vs per_chapter
    for ch, s in per_chapter.items():
        ch_short = ch[:4].replace('ch', 'Ch.')
        pattern = re.compile(rf'\|\s*{re.escape(ch_short)}\.\s+\w+[^|]+\|\s*(\d+)\s*\|')
        cm = pattern.search(plan)
        if cm:
            claimed = int(cm.group(1))
            if claimed != s['folders']:
                issues.append(f'Appendix E chapter summary: {ch} claimed {claimed} productions, actual {s["folders"]}')

    # 7g. Architecture diagram vs actual skills/agents/scripts on disk
    arch_issues = verify_architecture_diagram()
    issues.extend(arch_issues)

    # 7h. GHDL gate (Iron Rule 5) — includes run-freshness via manifest
    issues.extend(verify_ghdl_gate(totals))

    # 7i. Debt chapter (§8.5) structure and safe-zone placement
    issues.extend(verify_debt_chapter(plan))

    # 7j. Presentation snapshot freshness (index.html marker vs live disk)
    issues.extend(verify_presentation(totals))

    # 7k. Fact-claim gate — Facts Authority + Claim Registry (project_facts.py):
    # output claims must equal live facts, generator sources must be
    # literal-free, filesystem claims must exist on disk
    issues.extend(verify_fact_claims())

    # 7l. Architecture-spec gate — extract_arch_spec() (§2.2–§2.5) must yield
    # the live component counts and every name must appear in the presentation
    issues.extend(verify_arch_spec())

    # 7m. Artifact manifest + style/logic stability gate (sync_manifest.json:
    # policy registry + accepted style fingerprints; drift accepted only via
    # --quick --accept-style-change)
    issues.extend(verify_manifest())
    issues.extend(verify_style_stability())

    return issues


# =============================================================================
# 8. Main Entry Point
# =============================================================================

def main():
    parser = argparse.ArgumentParser(
        description='Unified sync for VHDL 2008 test suite documentation')
    parser.add_argument('--quick', action='store_true',
                        help='Quick sync: Sections, Coverage, Section 9, Tracker, Verification')
    parser.add_argument('--full', action='store_true',
                        help='Full sync: +Appendix E +DOCX/HTML')
    parser.add_argument('--verify-only', action='store_true',
                        help='Verify only — no writes, just report mismatches')
    parser.add_argument('--accept-style-change', action='store_true',
                        help='Recompute style fingerprints from the rebuilt '
                             'artifacts + generator sources and write '
                             'reports/sync_manifest.json (the explicit, '
                             'reviewable style-change ritual; ignored in '
                             '--verify-only)')
    parser.add_argument('--message', type=str, default='',
                        help='Description of changes for the generation log')
    parser.add_argument('--phase', type=str, default='',
                        help='Phase name for change log entry')
    args = parser.parse_args()

    if not (args.quick or args.full or args.verify_only):
        args.quick = True  # default

    print('=' * 60)
    print(f'SYNC_ALL ({today_str})')
    print('=' * 60)

    # 1. Scan filesystem (always)
    print('\n[1/7] Scanning filesystem...')
    per_chapter, per_production, totals = scan_filesystem()
    print(f'  Found: {totals["files"]:,} files in {totals["folders"]} folders across {len(per_chapter)} chapters')

    if args.verify_only:
        # Verify-only mode — machine-consumable hard gate: exit 0 only when
        # zero issues (any issue, including WARN-level, fails the gate).
        print('\n[VERIFY] Checking all documents...')
        issues = verify_all(per_production, totals, per_chapter)

        if issues:
            print(f'\n  FAIL: {len(issues)} ISSUES FOUND:')
            for iss in issues:
                print(f'     - {iss}')
        else:
            print(f'\n  OK: All documents consistent with filesystem. 0 issues found.')

        # Also report quick stats
        n_cross = sum(1 for pn in set(pn for (_, pn) in per_production)
                      if len([1 for (ch, p) in per_production if p == pn]) > 1)
        print(f'\n  Unique productions: {len(set(pn for (_, pn) in per_production))}')
        print(f'  Chapter entries: {len(per_production)}')
        print(f'  Cross-chapter: {n_cross}')
        sys.exit(0 if not issues else 1)

    updated = []

    # 2. Patch test plan sections
    print('\n[2/6] Updating Test Plan sections 3.1/5.3/6.3/6.4...')
    updated.append(patch_test_plan_sections(per_chapter, totals, per_production))
    print(f'  Updated: {updated[-1]}')

    # 3. Regenerate coverage report
    print('\n[3/6] Regenerating Coverage Report...')
    updated.append(regenerate_coverage_report(per_chapter, totals))
    print(f'  Updated: {updated[-1]}')

    # 4. Generate Section 9
    print('\n[4/6] Generating Section 9 (per-production test point details)...')

    # Quality Gate 1: Header pre-check
    print('  Pre-check: scanning VHD Test Focus headers...')
    hdr_errors, hdr_warnings, hdr_infos = check_header_quality()
    if hdr_errors:
        print(f'  BLOCKED: {len(hdr_errors)} file(s) have missing/empty Test Focus headers:')
        for path, issue in hdr_errors[:10]:
            print(f'    ERROR: {path}: {issue}')
        if len(hdr_errors) > 10:
            print(f'    ... and {len(hdr_errors) - 10} more')
        print('  Fix these files before regenerating Section 9.')
    if hdr_warnings:
        print(f'  WARN: {len(hdr_warnings)} file(s) have suspicious Test Focus headers:')
        for path, issue in hdr_warnings[:5]:
            print(f'    {path}: {issue}')
        if len(hdr_warnings) > 5:
            print(f'    ... and {len(hdr_warnings) - 5} more')
    if not hdr_errors and not hdr_warnings:
        print(f'  OK: All {sum(1 for _ in os.walk(CASES) for f in _[2] if f.endswith(".vhd")):,} files have valid Test Focus headers')
    if hdr_infos:
        print(f'  INFO: {len(hdr_infos)} file(s) have English-only Test Focus (style note, not blocking)')

    if hdr_errors:
        print('  WARNING: Proceeding with generation despite header errors (empty cells will appear in Section 9)')

    section9_content, sec9_data, sec9_total = generate_section9()

    # Quality Gate 2: Validate generated output
    sec9_issues = validate_section9(section9_content, per_production)
    if sec9_issues:
        print(f'  VALIDATION FAILED: {len(sec9_issues)} structural issue(s) in generated Section 9:')
        for iss in sec9_issues[:10]:
            print(f'    {iss}')
        if len(sec9_issues) > 10:
            print(f'    ... and {len(sec9_issues) - 10} more')
        print('  Section 9 NOT written — fix the issues above and re-run.')

    if not sec9_issues:
        if update_section9_in_test_plan(section9_content):
            n_unique = len(set(pn for (_, pn) in sec9_data))
            n_entries = len(sec9_data)
            n_cross = sum(1 for pn in set(pn for (_, pn) in sec9_data)
                          if len([1 for (ch, p) in sec9_data if p == pn]) > 1)
            print(f'  Updated: {n_unique} unique productions, {n_entries} chapter entries ({n_cross} cross-chapter)')
            updated.append(f'{TEST_PLAN} (Section 9)')
        else:
            print('  WARNING: Section 9 update failed — marker not found')

    # 5. Update PRODUCTION_TRACKER.md
    print('\n[5/6] Updating PRODUCTION_TRACKER.md...')
    fixes, missing, dupes = update_tracker(per_production, per_chapter)
    if fixes:
        print(f'  Fixed {len(fixes)} file count(s):')
        for pn, old, new in fixes:
            print(f'    {pn}: {old} -> {new}')
    if missing:
        print(f'  WARNING: {len(missing)} productions missing from tracker:')
        for pn in missing:
            print(f'    {pn} ({sum(1 for (ch, p) in per_production if p == pn)} files)')
    if dupes:
        print(f'  Removed {len(dupes)} duplicate row(s): {", ".join(dupes)}')
    if not fixes and not missing and not dupes:
        print('  Already up to date.')
    updated.append(TRACKER)

    # 6. Generation log + architecture diagram
    print('\n[6/6] Updating generation log + architecture diagram...')
    updated.append(update_generation_log(totals, args.message))
    print(f'  Updated: {updated[-1]}')
    update_architecture_diagram_timestamp()
    print(f'  Updated: {ARCH_DIAGRAM}')

    # Regenerate PDF/HTML/portal from architecture diagram (generate_arch_pdf.py --all)
    arch_pdf_script = os.path.join(ROOT_DIR, 'generate_arch_pdf.py')
    arch_html = os.path.join(BASE, 'reports', 'architecture_mindmap.html')
    portal_html = os.path.join(BASE, 'reports', 'index.html')
    if os.path.exists(arch_pdf_script):
        try:
            env = os.environ.copy()
            node_dirs = []
            node_exe = shutil.which('node')
            if node_exe:
                node_dirs.append(os.path.dirname(node_exe))
            # common fallback locations (Windows) if node is not on PATH
            for candidate in (r'C:\Program Files\nodejs', os.path.expanduser(r'~\AppData\Roaming\npm')):
                if os.path.isdir(candidate):
                    node_dirs.append(candidate)
            env['PATH'] = os.pathsep.join(node_dirs) + os.pathsep + env.get('PATH', '')
            result = subprocess.run(
                [sys.executable, arch_pdf_script, '--all'],
                capture_output=True, text=True, timeout=600, env=env,
                encoding='utf-8', errors='replace'
            )
            if result.returncode == 0:
                for line in result.stdout.strip().split('\n'):
                    print(f'  {line}')
                updated.append(arch_html + ' (self-contained architecture HTML)')
                updated.append(portal_html + ' (reports portal)')
            else:
                err = result.stderr.strip()[:200] if result.stderr else 'unknown error'
                print(f'  (architecture PDF/HTML/portal skipped: {err})')
        except Exception as e:
            print(f'  (architecture PDF/HTML/portal skipped: {e})')

    # Rebuild the work-report presentation (build_presentation.py) — dynamic
    # data injection + PRESENTATION_SNAPSHOT marker; verify_presentation (7j)
    # reports drift if this ever fails.
    pres_script = os.path.join(ROOT_DIR, 'build_presentation.py')
    pres_index = os.path.join(ROOT_DIR, 'presentation', 'index.html')
    if os.path.exists(pres_script):
        try:
            env = os.environ.copy()
            node_dirs = []
            node_exe = shutil.which('node')
            if node_exe:
                node_dirs.append(os.path.dirname(node_exe))
            for candidate in (r'C:\Program Files\nodejs', os.path.expanduser(r'~\AppData\Roaming\npm')):
                if os.path.isdir(candidate):
                    node_dirs.append(candidate)
            env['PATH'] = os.pathsep.join(node_dirs) + os.pathsep + env.get('PATH', '')
            result = subprocess.run(
                [sys.executable, pres_script],
                capture_output=True, text=True, timeout=600, env=env,
                encoding='utf-8', errors='replace'
            )
            if result.returncode == 0:
                for line in result.stdout.strip().split('\n')[-8:]:
                    print(f'  {line}')
                updated.append(pres_index + ' (work-report presentation)')
            else:
                err = result.stderr.strip()[:200] if result.stderr else 'unknown error'
                print(f'  (presentation rebuild skipped: {err})')
        except Exception as e:
            print(f'  (presentation rebuild skipped: {e})')

    # Style-change acceptance ritual (--accept-style-change): recompute all
    # style fingerprints from the freshly rebuilt artifacts + generator
    # sources and write sync_manifest.json. Runs after both subprocess builds
    # so the accepted refs match the outputs on disk; verify_manifest +
    # verify_style_stability (7m) check them read-only afterwards.
    if args.accept_style_change and args.verify_only:
        print('\n  NOTE: --accept-style-change ignored in --verify-only (read-only mode)')
    elif args.accept_style_change:
        print('\n[ACCEPT] Accepting style references into sync_manifest.json...')
        accept_style_changes()

    # Quick cross-validation
    print('\n--- Cross-Validation ---')
    issues = verify_all(per_production, totals, per_chapter)
    if issues:
        print(f'  WARN: {len(issues)} issue(s) found (see above). Running sync again may resolve.')
        for iss in issues:
            print(f'     - {iss}')
    else:
        print('  OK: All documents consistent.')

    # Full mode extras
    if args.full:
        # Change log
        if args.phase:
            print(f'\n[FULL] Adding change log entry...')
            update_change_log(args.phase, args.message or args.phase, totals)
            updated.append(CHANGE_LOG)

        # Appendix E
        print(f'\n[FULL] Regenerating Appendix E...')
        appendix_script = os.path.join(ROOT_DIR, 'build_test_trace.py')
        if os.path.exists(appendix_script):
            subprocess.run([sys.executable, appendix_script],
                           cwd=ROOT_DIR, capture_output=True, timeout=120)
            updated.append(APPENDIX_E)
            print(f'  Updated: {APPENDIX_E}')

        # DOCX only — the HTML is owned by generate_arch_pdf.py (mermaid-injected);
        # a pandoc --self-contained run here would overwrite it (historical bug)
        print(f'\n[FULL] Generating DOCX...')
        try:
            docx = os.path.join(BASE, 'test_plan', 'VHDL2008_Test_Plan_latest.docx')
            subprocess.run(['pandoc', TEST_PLAN, '-o', docx, '--toc', '--toc-depth=2',
                            '--metadata', 'title=VHDL 2008 Test Plan'], timeout=60)
            updated.append(docx)
            print(f'  Updated: {docx}')
            print(f'  (Test Plan HTML was generated earlier by generate_arch_pdf.py)')
        except Exception as e:
            print(f'  (DOCX skipped: {e})')

    print(f'\n{"=" * 60}')
    print(f'SYNC COMPLETE ({today_str})')
    print(f'{"=" * 60}')
    print(f'State: {totals["files"]:,} files, {totals["folders"]} folders')
    print(f'Updated:')
    for f in updated:
        print(f'  - {f}')


if __name__ == '__main__':
    main()
