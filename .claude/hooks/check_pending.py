"""Stop hook: remind the user about unsettled cases_src edits (Iron Rule 1).

Closed-loop semantics (M-domain):
  Edit cases_src -> log_case_edit records -> check_pending (Stop) reminds
  -> session_verify (SessionStart) runs sync_all.py --verify-only;
     when verify passes, the log is cleared (previous edits settled).
`.claude/sync_pending.log` is M-domain: written/read ONLY by these hooks,
never by project-layer scripts.

Behavior:
  - sync_pending.log non-empty -> stdout {"systemMessage": "..."} (N = line count)
  - empty / missing -> {}
  - always exit 0.
"""
import json
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[2]
LOG_PATH = REPO_ROOT / '.claude' / 'sync_pending.log'


def _read_pending_count():
    try:
        if not LOG_PATH.exists():
            return 0
        with open(str(LOG_PATH), 'r', encoding='utf-8', errors='replace') as fh:
            return sum(1 for line in fh if line.strip())
    except Exception:
        return 0


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


def main():
    count = _read_pending_count()
    if count > 0:
        _emit({'systemMessage': '⚠ This session modified %d cases_src files but sync_pending.log is not settled (Iron Rule 1). It is auto-settled at the next session start when verify-only passes; consider running /doc-sync and /ghdl-verify now.' % count})
    else:
        _emit({})
    return 0


if __name__ == '__main__':
    try:
        main()
    except Exception:
        _emit({})
    sys.exit(0)
