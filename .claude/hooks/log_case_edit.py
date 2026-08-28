"""PostToolUse hook: machine-record cases_src .vhd edits (Iron Rule 1/5).

Closed-loop semantics (M-domain):
  Edit cases_src -> log_case_edit records -> check_pending (Stop) reminds
  -> session_verify (SessionStart) runs sync_all.py --verify-only;
     when verify passes, the log is cleared (previous edits settled).
`.claude/sync_pending.log` is M-domain: written/read ONLY by these hooks,
never by project-layer scripts.

Input: PostToolUse payload on stdin (JSON). tool_input may be:
  {"file_path": "..."}                 # Edit / Write
  {"file_path": ["...", ...]}          # MultiEdit (array form)
  {"edits": [{"file_path": "..."}, ]}  # MultiEdit (edits-list form)
All forms are collected; every collected path is matched.

Output (stdout JSON):
  hit         -> {"continue": true, "hookSpecificOutput": {...additionalContext...}}
  miss/error  -> {}
Exit code: always 0 (must never block the tool).
"""
import fnmatch
import json
import os
import sys
from datetime import datetime
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[2]
LOG_PATH = REPO_ROOT / '.claude' / 'sync_pending.log'
CASES_PATTERN = '*/vhdl2008_grammar_test/test_case_db/cases_src/*.vhd'


def _norm_rel(path_value):
    """Normalize an absolute or relative path to a slash-separated,
    case-folded repo-relative path. Returns None when unusable."""
    if not isinstance(path_value, str):
        return None
    p = path_value.strip()
    if not p:
        return None
    p = p.replace('\\', '/')
    root = str(REPO_ROOT).replace('\\', '/')
    if p.lower().startswith(root.lower() + '/'):
        p = p[len(root) + 1:]
    while p.startswith('./'):
        p = p[2:]
    return os.path.normcase(p).replace('\\', '/')


def _matches_cases(rel):
    """fnmatch needs one path component before the pattern's leading '*/';
    rel paths start directly with 'vhdl2008_...', so match './'+rel instead."""
    candidate = rel if rel.startswith('/') else './' + rel
    return fnmatch.fnmatch(candidate, CASES_PATTERN)


def _collect_paths(tool_input):
    paths = []
    if not isinstance(tool_input, dict):
        return paths
    fp = tool_input.get('file_path')
    if isinstance(fp, str):
        paths.append(fp)
    elif isinstance(fp, list):
        paths.extend(x for x in fp if isinstance(x, str))
    edits = tool_input.get('edits')
    if isinstance(edits, list):
        for entry in edits:
            if isinstance(entry, dict):
                efp = entry.get('file_path')
                if isinstance(efp, str):
                    paths.append(efp)
                elif isinstance(efp, list):
                    paths.extend(x for x in efp if isinstance(x, str))
    return paths


def _read_log():
    """Return [(timestamp, relpath), ...]; malformed lines are dropped."""
    entries = []
    try:
        if not LOG_PATH.exists():
            return entries
        with open(str(LOG_PATH), 'r', encoding='utf-8', errors='replace') as fh:
            for line in fh:
                line = line.rstrip('\r\n')
                if not line:
                    continue
                parts = line.split('\t', 1)
                if len(parts) == 2 and parts[1]:
                    entries.append((parts[0], parts[1]))
    except Exception:
        return []
    return entries


def _write_log(entries):
    """utf-8, no BOM, LF line endings."""
    try:
        with open(str(LOG_PATH), 'w', encoding='utf-8', newline='\n') as fh:
            for ts, rel in entries:
                fh.write('%s\t%s\n' % (ts, rel))
        return True
    except Exception:
        return False


def _record(paths):
    """Append new hits, refresh timestamps of existing ones (deduped).
    Returns the resulting number of log lines; 0 when nothing matched."""
    hits = []
    for raw in paths:
        rel = _norm_rel(raw)
        if rel and _matches_cases(rel):
            if rel not in hits:
                hits.append(rel)
    if not hits:
        return 0
    now = datetime.utcnow().strftime('%Y-%m-%dT%H:%M:%SZ')
    entries = _read_log()
    index = {}
    for i, (ts, rel) in enumerate(entries):
        index[rel] = i
    for rel in hits:
        if rel in index:
            entries[index[rel]] = (now, rel)
        else:
            index[rel] = len(entries)
            entries.append((now, rel))
    if not _write_log(entries):
        return 0
    return len(entries)


def _safe_load_stdin():
    try:
        raw = sys.stdin.buffer.read()
        return json.loads(raw.decode('utf-8', errors='replace'))
    except Exception:
        return None


def _emit(obj):
    try:
        sys.stdout.reconfigure(encoding='utf-8')
    except Exception:
        pass
    try:
        sys.stdout.write(json.dumps(obj, ensure_ascii=False) + '\n')
        sys.stdout.flush()
    except Exception:
        pass


def _reminder_text(count):
    return ('IRON RULE 1/5 machine record: cases_src files were modified '
            'this session (%d cumulative in this session). '
            'Before wrapping up you MUST /doc-sync and /ghdl-verify, '
            'and python sync_all.py --verify-only must show 0 issues. '
            'This reminder is generated by the PostToolUse hook, '
            'not by model memory.' % count)


def main():
    payload = _safe_load_stdin()
    tool_input = (payload or {}).get('tool_input') or {}
    try:
        count = _record(_collect_paths(tool_input))
    except Exception:
        count = 0
    if count > 0:
        _emit({'continue': True,
               'hookSpecificOutput': {'hookEventName': 'PostToolUse',
                                      'additionalContext': _reminder_text(count)}})
    else:
        _emit({})
    return 0


if __name__ == '__main__':
    try:
        main()
    except Exception:
        _emit({})
    sys.exit(0)
