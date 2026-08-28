"""SessionStart hook: read-only gate -- sync_all.py --verify-only.

Closed-loop semantics (M-domain):
  Edit cases_src -> log_case_edit records -> check_pending (Stop) reminds
  -> session_verify (SessionStart) runs sync_all.py --verify-only;
     when verify passes, the log is cleared (previous edits settled).
`.claude/sync_pending.log` is M-domain: written/read ONLY by these hooks,
never by project-layer scripts.

READ-ONLY IRON LAW: this hook invokes ONLY `sync_all.py --verify-only`.
It never calls --quick/--full or any document-writing command, otherwise
the hook could recurse or mutate project files.

Behavior:
  - verify exit 0 and stdout contains "0 issues found":
        sync_pending.log is cleared when non-empty (verify passed =
        previous edits settled); stdout {} either way (silent).
  - verify exit != 0:
        lines after "ISSUES FOUND" are extracted (stripped, first 12
        shown); stdout {"continue": true, "hookSpecificOutput":
        {"hookEventName": "SessionStart", "additionalContext":
        "HARNESS GATE: ..."}}.
  - timeout / any exception: stdout {}, exit 0 (never block the session).
"""
import json
import subprocess
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[2]
LOG_PATH = REPO_ROOT / '.claude' / 'sync_pending.log'
VERIFY_TIMEOUT = 100


def _read_pending_count():
    try:
        if not LOG_PATH.exists():
            return 0
        with open(str(LOG_PATH), 'r', encoding='utf-8', errors='replace') as fh:
            return sum(1 for line in fh if line.strip())
    except Exception:
        return 0


def _clear_log():
    try:
        if LOG_PATH.exists():
            LOG_PATH.unlink()
    except Exception:
        pass


def _run_verify():
    """Returns (returncode, stdout_str). Any failure -> (None, '')."""
    try:
        proc = subprocess.run(
            [sys.executable, 'sync_all.py', '--verify-only'],
            cwd=str(REPO_ROOT),
            capture_output=True,
            encoding='utf-8',
            errors='replace',
            timeout=VERIFY_TIMEOUT,
        )
    except Exception:
        return None, ''
    return proc.returncode, proc.stdout or ''


def _extract_issues(stdout):
    lines = stdout.splitlines()
    marker = -1
    for i, line in enumerate(lines):
        if 'ISSUES FOUND' in line:
            marker = i
            break
    if marker < 0:
        return []
    return [ln.strip() for ln in lines[marker + 1:] if ln.strip()]


def _build_alarm_message(returncode, stdout, pending):
    issues = _extract_issues(stdout)
    total = len(issues)
    detail = '; '.join(issues[:12]) if issues else '(no detail lines)'
    return ('HARNESS GATE: sync_all.py --verify-only exited with code %d; '
            'currently %d issues (first 12: %s). '
            'Fix them before starting work, otherwise later changes '
            'cannot be confirmed against the baseline. '
            'Also %d cases_src files in sync_pending.log remain unsettled.'
            % (returncode, total, detail, pending))


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
    returncode, stdout = _run_verify()
    pending = _read_pending_count()
    if returncode == 0 and '0 issues found' in stdout:
        if pending > 0:
            _clear_log()
        _emit({})
        return 0
    if returncode is not None and returncode != 0:
        _emit({'continue': True,
               'hookSpecificOutput': {'hookEventName': 'SessionStart',
                                      'additionalContext': _build_alarm_message(returncode, stdout, pending)}})
        return 0
    _emit({})
    return 0


if __name__ == '__main__':
    try:
        main()
    except Exception:
        _emit({})
    sys.exit(0)
