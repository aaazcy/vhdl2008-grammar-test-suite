#!/usr/bin/env python3
"""Facts Authority + Claim Registry — single source of truth for project facts.

Every factual claim in the project's prose/templates (numbers, paths,
architecture counts) is verified against the facts computed here by
sync_all.py's verify_fact_claims() (verify step 7k). The gate is two-sided:

  * Output side — claims in the rendered documents must equal the facts.
  * Source side — generator sources must be literal-free: any registry match
    in a generator source is a hardcoded fact (placeholders like
    {{TOTAL_FILES}} contain no digits, so a match in source IS a literal).

compute_facts() is memoized per process. Importing this module has no side
effects — facts are computed lazily on the first compute_facts() call.
"""

import csv
import os
import re

# === Paths (all derived from this file's location — the repo root) ===
_ROOT = os.path.dirname(os.path.abspath(__file__))
_BASE = os.path.join(_ROOT, 'vhdl2008_grammar_test')
_CASES = os.path.join(_BASE, 'test_case_db', 'cases_src')
_TRACKER = os.path.join(_ROOT, 'PRODUCTION_TRACKER.md')
_BNF_CSV = os.path.join(_BASE, 'test_case_db', 'reference', 'bnf_reference.csv')
_SEM_CSV = os.path.join(_BASE, 'test_case_db', 'reference', 'semantic_rules.csv')
_SKILLS_DIR = os.path.join(_ROOT, '.claude', 'skills')
_AGENTS_DIR = os.path.join(_ROOT, '.claude', 'agents')
_HOOKS_DIR = os.path.join(_ROOT, '.claude', 'hooks')
_LEGACY_DIR = os.path.join(_ROOT, 'legacy_scripts')

_facts = None


def compute_facts():
    """Compute all project facts from live sources (memoized per process).

    Returns a dict:
      total_files, chapters, folders, per_chapter, per_production
          — filesystem scan of cases_src/ (same walk shape as
            sync_all.py's scan_filesystem)
      bnf_total, bnf_in_scope, bnf_excluded, sem_total
          — reference CSVs (same derivation as sync_all.py's
            load_reference_counts: DictReader, delimiter=';',
            cover_status == 'Covered' means in scope)
      production_count
          — PRODUCTION_TRACKER.md title ('All N Productions')
      skills, agents, hooks, root_scripts
          — live scans; root_scripts reuses sync_all.py's
            live_root_scripts() directory-exclusion rule (anything archived
            under legacy_scripts/ is not a living root script; the isdir
            guard is kept because legacy_scripts/ may not exist).
    """
    global _facts
    if _facts is not None:
        return _facts

    # --- 1. filesystem scan of cases_src/ ---
    per_chapter = {}
    per_production = {}
    total_files = 0
    folders = 0
    if os.path.isdir(_CASES):
        for ch in sorted(os.listdir(_CASES)):
            ch_path = os.path.join(_CASES, ch)
            if not ch.startswith('ch') or not os.path.isdir(ch_path):
                continue
            prod_dirs = [d for d in os.listdir(ch_path)
                         if os.path.isdir(os.path.join(ch_path, d))]
            ch_files = 0
            for prod in sorted(prod_dirs):
                n = sum(1 for f in os.listdir(os.path.join(ch_path, prod))
                        if f.endswith('.vhd'))
                per_production[(ch, prod)] = n
                ch_files += n
            per_chapter[ch] = {'folders': len(prod_dirs), 'files': ch_files}
            total_files += ch_files
            folders += len(prod_dirs)

    # --- 2. reference CSV counts (single source of truth for BNF / semantic) ---
    bnf_total = bnf_excluded = sem_total = 0
    if os.path.exists(_BNF_CSV):
        with open(_BNF_CSV, 'r', encoding='utf-8-sig') as f:
            bnf_rows = list(csv.DictReader(f, delimiter=';'))
        bnf_total = len(bnf_rows)
        bnf_excluded = sum(
            1 for r in bnf_rows
            if (r.get('cover_status') or '').strip() != 'Covered')
    if os.path.exists(_SEM_CSV):
        with open(_SEM_CSV, 'r', encoding='utf-8-sig') as f:
            sem_total = len(list(csv.DictReader(f, delimiter=';')))
    bnf_in_scope = bnf_total - bnf_excluded

    # --- 3. production count from the tracker title ---
    production_count = 0
    if os.path.exists(_TRACKER):
        with open(_TRACKER, 'r', encoding='utf-8', errors='replace') as f:
            tracker_text = f.read()
        m = re.search(r'^# Production Tracker\b.*All (\d+) Productions',
                      tracker_text, re.MULTILINE)
        if m:
            production_count = int(m.group(1))

    # --- 4. architecture counts via live scan ---
    skills = sorted(f[:-3] for f in os.listdir(_SKILLS_DIR) if f.endswith('.md')) \
        if os.path.isdir(_SKILLS_DIR) else []
    agents = sorted(f[:-3] for f in os.listdir(_AGENTS_DIR) if f.endswith('.md')) \
        if os.path.isdir(_AGENTS_DIR) else []
    hooks = sorted(f for f in os.listdir(_HOOKS_DIR)
                   if f.endswith('.py') and os.path.isfile(os.path.join(_HOOKS_DIR, f))) \
        if os.path.isdir(_HOOKS_DIR) else []
    # Same directory-exclusion rule as sync_all.py's live_root_scripts():
    # anything archived under legacy_scripts/ is not living architecture.
    legacy = set()
    if os.path.isdir(_LEGACY_DIR):
        legacy = {f for f in os.listdir(_LEGACY_DIR) if f.endswith('.py')}
    root_scripts = sorted(
        f for f in os.listdir(_ROOT)
        if f.endswith('.py') and os.path.isfile(os.path.join(_ROOT, f))
        and f not in legacy)

    _facts = {
        'total_files': total_files,
        'chapters': len(per_chapter),
        'folders': folders,
        'per_chapter': per_chapter,
        'per_production': per_production,
        'bnf_total': bnf_total,
        'bnf_in_scope': bnf_in_scope,
        'bnf_excluded': bnf_excluded,
        'sem_total': sem_total,
        'production_count': production_count,
        'skills': len(skills),
        'agents': len(agents),
        'hooks': len(hooks),
        'root_scripts': len(root_scripts),
    }
    return _facts


# =============================================================================
# CLAIM_REGISTRY — factual claim patterns (order = priority)
# =============================================================================
#
# Each entry is (compiled_regex, fact_key(s), description). The resolver
# (scan_claims) scans the rules IN ORDER and a match span consumed by a
# higher-priority rule is skipped — each claim is matched by exactly one rule.
#
# Design decisions (conservative registry — only patterns that denote factual
# claims, so correct prose never gets false-flagged):
#   * "(\d+) in-scope Annex C BNF productions" comes FIRST (more specific),
#     and "(\d+) BNF productions (?:from|with)" (the Annex C total phrasing
#     used in the test plan) comes before the generic "(\d+) BNF
#     productions" (tracker productions), so one phrase never feeds two facts.
#   * Skills/Agents rules are capitalized: the current-state claim forms in
#     architecture_mindmap.md are "4 Skills" / "4 Agents", while lowercase
#     "N agents" prose is almost always historical ("8 agents in parallel"
#     in the trends/phase narrative) — matching it would false-flag history.
#   * Every digit group carries a (?<![\w.]) lookbehind so digits embedded in
#     words or section numbers are never matched: "P0 semantic rules" must
#     not become "0 semantic rules", and "### 2.2 Skills" must not become
#     "2 Skills". The same lookbehind keeps "ch10 test files" from matching
#     as "0 test files".
#   * "(\d{2,3})\+(\d{2,3})" matches the "in-scope + semantic" result card
#     only (single-digit sums like "4+4" in the skills card are ignored).
CLAIM_REGISTRY = (
    (re.compile(r'(?<![\w.])(\d+) in-scope Annex C BNF productions'),
     'bnf_in_scope', 'in-scope Annex C BNF productions'),
    (re.compile(r'(?<![\w.])(\d+) BNF productions (?:from|with)'),
     'bnf_total', 'total Annex C BNF productions'),
    (re.compile(r'(?<![\w.])(\d+) BNF productions'),
     'production_count', 'tracked BNF productions (PRODUCTION_TRACKER title)'),
    (re.compile(r'All (\d+) Productions'), 'production_count',
     'tracked productions (PRODUCTION_TRACKER title)'),
    (re.compile(r'(?<![\w.])([\d][\d,]*) test files'), 'total_files',
     'test files on disk'),
    (re.compile(r'(?<![\w.])([\d][\d,]*) semantic rules'), 'sem_total',
     'core semantic rules'),
    (re.compile(r'(?<![\w.])(\d{2,3})\+(\d{2,3})'),
     ('bnf_in_scope', 'sem_total'), 'in-scope BNF + semantic rules card'),
    (re.compile(r'(?<![\w.])([\d][\d,]*) unique productions'),
     'production_count', 'unique productions on disk'),
    (re.compile(r'(?<![\w.])(\d+) Skills'), 'skills',
     'Claude skills (.claude/skills)'),
    (re.compile(r'(?<![\w.])(\d+) Agents'), 'agents',
     'Claude agents (.claude/agents)'),
    (re.compile(r'(?<![\w.])(\d+) hooks'), 'hooks',
     'harness hooks (.claude/hooks)'),
    (re.compile(r'(?<![\w.])(\d+) root scripts'), 'root_scripts',
     'living root scripts (legacy_scripts/ excluded)'),
    (re.compile(r'(?<![\w.])([\d][\d,]*) chapters'), 'chapters',
     'IEEE chapters (cases_src)'),
)


# =============================================================================
# Exempt zones — historical narrative, hand-maintained by design
# =============================================================================

def exempt_zones(text, kind):
    """Return sorted, merged (start, end) spans excluded from claim scanning.

    kind:
      'presentation_html' — the whole evolution section
        (<section id="evolution"> to its closing </section>) plus every
        <details class="phase"> accordion block (phase history, step notes,
        the appendix event-log table). These are dated historical records,
        deliberately hand-maintained — their numbers are milestones, not
        current-state claims.
      'test_plan' — the Migration Log table block and any dated changelog
        (from the heading to the next heading of any level).
      'markdown' — no exemptions (current-state documents).
    """
    zones = []
    if kind == 'presentation_html':
        for m in re.finditer(r'<section id="evolution"[^>]*>', text):
            end = text.find('</section>', m.end())
            if end != -1:
                zones.append((m.start(), end + len('</section>')))
        for m in re.finditer(r'<details class="phase"[^>]*>', text):
            end = text.find('</details>', m.end())
            if end != -1:
                zones.append((m.start(), end + len('</details>')))
    elif kind == 'test_plan':
        for m in re.finditer(
                r'^#{2,4}\s+.*(migration log|change log|changelog).*$',
                text, re.MULTILINE | re.IGNORECASE):
            nxt = re.search(r'^#{1,4}\s+\S', text[m.end():], re.MULTILINE)
            end = m.end() + nxt.start() if nxt else len(text)
            zones.append((m.start(), end))

    zones.sort()
    merged = []
    for s, e in zones:
        if merged and s <= merged[-1][1]:
            merged[-1] = (merged[-1][0], max(merged[-1][1], e))
        else:
            merged.append((s, e))
    return merged


def _overlaps(start, end, spans):
    for s, e in spans:
        if start < e and end > s:
            return True
    return False


def scan_claims(text, masked_spans=()):
    """Resolve CLAIM_REGISTRY over text (exempt spans excluded).

    Yields dicts {text, values, keys, description, line} for non-overlapping
    matches. For each rule in priority order, a match position already
    consumed by a higher-priority rule (or inside a masked span) is skipped.
    """
    consumed = sorted(masked_spans)
    for regex, fact_keys, description in CLAIM_REGISTRY:
        keys = fact_keys if isinstance(fact_keys, tuple) else (fact_keys,)
        for m in regex.finditer(text):
            s, e = m.span()
            if _overlaps(s, e, consumed):
                continue
            consumed.append((s, e))
            values = tuple(int(g.replace(',', '')) for g in m.groups())
            yield {'text': m.group(0), 'values': values, 'keys': keys,
                   'description': description,
                   'line': text.count('\n', 0, s) + 1}


# =============================================================================
# Filesystem claims — backticked repo-relative paths must exist on disk
# =============================================================================

# Known root segments (prefix -> absolute-path builder). Everything else is
# deliberately ignored (e.g. legacy_scripts/, test_case_db/, logs/ — archive
# and internal paths are not claim-checked).
_PATH_SEGMENTS = (
    ('presentation/', lambda tok: os.path.join(_ROOT, tok)),
    ('vhdl2008_grammar_test/', lambda tok: os.path.join(_ROOT, tok)),
    ('cases_src', lambda tok: os.path.join(_BASE, 'test_case_db', tok)),
    ('reports/', lambda tok: os.path.join(_BASE, tok)),
    ('test_plan/', lambda tok: os.path.join(_BASE, tok)),
    ('.claude/', lambda tok: os.path.join(_ROOT, tok)),
)

# Runtime-created machine records: documented in prose as part of the harness
# mechanism, but only present on disk after the harness has written them —
# their absence is a normal state (no pending edits), not a stale claim.
_RUNTIME_PATHS = ('sync_pending.log',)


def _script_exists(name):
    """Root .py existence — root dir, .claude/ (hooks), or legacy_scripts/."""
    if os.path.isfile(os.path.join(_ROOT, name)):
        return True
    for sub in ('.claude', 'legacy_scripts'):
        sub_root = os.path.join(_ROOT, sub)
        if not os.path.isdir(sub_root):
            continue
        for _r, _d, fnames in os.walk(sub_root):
            if name in fnames:
                return True
    return False


def _missing_path(tok):
    """Return the absolute path that does not exist, or None if the backticked
    token is not a claim or the claim holds."""
    for prefix, build in _PATH_SEGMENTS:
        if tok.startswith(prefix):
            path = build(tok)
            return None if os.path.exists(path) else path
    if '/' not in tok and tok.endswith('.py'):
        for name in re.findall(r'[\w-]+\.py', tok):
            if not _script_exists(name):
                return os.path.join(_ROOT, name)
    return None


def filesystem_claims(text, label):
    """Check backticked path claims in markdown text against disk.

    Only backticked strings containing '/' that start with a known root
    segment, or root *.py tokens, are checked. Placeholder/glob tokens
    (containing '<' or '*') are skipped. Returns issue strings.
    """
    issues = []
    for m in re.finditer(r'`([^`\n]+)`', text):
        tok = m.group(1)
        if '<' in tok or '*' in tok:
            continue  # placeholder or glob pattern, not a literal path
        if any(tok == p or tok.endswith('/' + p) for p in _RUNTIME_PATHS):
            continue  # runtime-created machine record, absent until written
        missing = _missing_path(tok)
        if missing:
            line = text.count('\n', 0, m.start()) + 1
            issues.append(
                f'Filesystem claim stale: "`{tok}`" in {label}:{line} '
                f'does not exist on disk (checked {missing})')
    return issues
