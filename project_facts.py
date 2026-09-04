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
_CLAUDE = os.path.join(_ROOT, 'CLAUDE.md')
_MINDMAP = os.path.join(_BASE, 'reports', 'architecture_mindmap.md')
_SKILL_FILE = os.path.join(_SKILLS_DIR, 'vhdl-test-generator.md')

_facts = None


def compute_facts():
    """Compute all project facts from live sources (memoized per process).

    Returns a dict:
      total_files, chapters, folders, per_chapter, per_production
          — filesystem scan of cases_src/ (same walk shape as
            sync_all.py's scan_filesystem)
      bnf_total, bnf_in_scope, bnf_excluded, sem_total,
      bnf_new_2008, bnf_p0, bnf_p1, sem_p0, sem_categories
          — reference CSVs (same derivation as sync_all.py's
            load_reference_counts: DictReader, delimiter=';',
            cover_status == 'Covered' means in scope; sem_categories is the
            [(category, {rules, P0, P1, P2}), ...] list ordered by rule
            count desc)
      production_count
          — PRODUCTION_TRACKER.md title ('All N Productions')
      skills, agents, hooks, root_scripts
          — live scans; root_scripts reuses sync_all.py's
            live_root_scripts() directory-exclusion rule (anything archived
            under legacy_scripts/ is not a living root script; the isdir
            guard is kept because legacy_scripts/ may not exist).
      doc_kinds
          — data rows of the architecture_mindmap.md §2.5 Documents table
      iron_rules
          — numbered rule headings in the CLAUDE.md '## Iron Rules' section
            (CLAUDE.md is the definition site for the orchestration rules)
      skill_iron_rules
          — numbered rule headings in the vhdl-test-generator skill's
            '## The 12 Iron Rules' section (the content-quality rules; their
            definition site — the registry's ANY(Iron Rules) rule verifies
            "12 Iron Rules" claims against this live count so correct prose
            never false-flags)
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
    bnf_new_2008 = bnf_p0 = bnf_p1 = 0
    sem_p0 = 0
    sem_categories = []
    if os.path.exists(_BNF_CSV):
        with open(_BNF_CSV, 'r', encoding='utf-8-sig') as f:
            bnf_rows = list(csv.DictReader(f, delimiter=';'))
        bnf_total = len(bnf_rows)
        bnf_excluded = sum(
            1 for r in bnf_rows
            if (r.get('cover_status') or '').strip() != 'Covered')
        bnf_new_2008 = sum(
            1 for r in bnf_rows
            if (r.get('is_2008_new') or '').strip() == 'Yes')
        bnf_p0 = sum(
            1 for r in bnf_rows
            if (r.get('default_priority') or '').strip() == 'P0')
        bnf_p1 = sum(
            1 for r in bnf_rows
            if (r.get('default_priority') or '').strip() == 'P1')
    if os.path.exists(_SEM_CSV):
        with open(_SEM_CSV, 'r', encoding='utf-8-sig') as f:
            sem_rows = list(csv.DictReader(f, delimiter=';'))
        sem_total = len(sem_rows)
        sem_p0 = sum(1 for r in sem_rows
                     if (r.get('rule_priority') or '').strip() == 'P0')
        by_cat = {}
        for r in sem_rows:
            cat = (r.get('error_category') or 'unspecified').strip()
            prio = (r.get('rule_priority') or '').strip()
            c = by_cat.setdefault(cat, {'rules': 0, 'P0': 0, 'P1': 0, 'P2': 0})
            c['rules'] += 1
            if prio in c:
                c[prio] += 1
        sem_categories = sorted(by_cat.items(), key=lambda kv: -kv[1]['rules'])
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

    # --- 3b. document kinds: data rows of the mindmap §2.5 Documents table ---
    doc_kinds = 0
    if os.path.exists(_MINDMAP):
        with open(_MINDMAP, 'r', encoding='utf-8', errors='replace') as f:
            mindmap = f.read()
        sec = re.search(r'^### 2\.5 Documents\s*$', mindmap, re.MULTILINE)
        if sec:
            end = re.search(r'^## \S', mindmap[sec.end():], re.MULTILINE)
            block = mindmap[sec.end():
                            sec.end() + end.start()] if end else mindmap[sec.end():]
            for line in block.splitlines():
                if not re.match(r'^\s*\|\s*[^|\-]', line):
                    continue
                if re.match(r'^\s*\|[\s\-:|]+\|?\s*$', line):
                    continue  # separator row
                if re.match(r'^\s*\|\s*Document\s*\|', line):
                    continue  # header row
                doc_kinds += 1

    # --- 3c. iron rules: CLAUDE.md Iron Rules section (definition site) ---
    iron_rules = 0
    if os.path.exists(_CLAUDE):
        with open(_CLAUDE, 'r', encoding='utf-8', errors='replace') as f:
            claude = f.read()
        sec = re.search(r'^## Iron Rules\b', claude, re.MULTILINE)
        if sec:
            end = re.search(r'^## \S', claude[sec.end():], re.MULTILINE)
            block = claude[sec.end():
                           sec.end() + end.start()] if end else claude[sec.end():]
            iron_rules = len(re.findall(r'^\d+\.\s+\*\*', block, re.MULTILINE))

    # --- 3d. skill_iron_rules: the vhdl-test-generator skill's content rules
    # ("## The 12 Iron Rules" is their single definition site) — supports the
    # registry's ANY(Iron Rules) rule, which verifies "12 Iron Rules" claims
    # against this live count so correct prose never false-flags ---
    skill_iron_rules = 0
    if os.path.exists(_SKILL_FILE):
        with open(_SKILL_FILE, 'r', encoding='utf-8', errors='replace') as f:
            skill_md = f.read()
        sec = re.search(r'^## The 12 Iron Rules\b', skill_md, re.MULTILINE)
        if sec:
            end = re.search(r'^## \S', skill_md[sec.end():], re.MULTILINE)
            block = skill_md[sec.end():
                             sec.end() + end.start()] if end else skill_md[sec.end():]
            skill_iron_rules = len(re.findall(r'^\d+\.\s+\*\*', block, re.MULTILINE))

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
        'bnf_new_2008': bnf_new_2008,
        'bnf_p0': bnf_p0,
        'bnf_p1': bnf_p1,
        'sem_p0': sem_p0,
        'sem_categories': sem_categories,
        'production_count': production_count,
        'skills': len(skills),
        'agents': len(agents),
        'hooks': len(hooks),
        'root_scripts': len(root_scripts),
        'doc_kinds': doc_kinds,
        'iron_rules': iron_rules,
        'skill_iron_rules': skill_iron_rules,
    }
    return _facts


# =============================================================================
# extract_arch_spec — architecture spec parsed from architecture_mindmap.md
# =============================================================================
#
# The presentation's drill-down chart is rendered generically from this spec
# (build_presentation.py injects it as {{ARCH_SPEC}}). The mindmap §2.2–§2.5
# is the single source of truth for component names, models, one-liners and
# detail tables — no hand-maintained data copy lives in the presentation.

_arch_spec = None

# (mindmap section number, spec key) — §2.4's legacy_scripts subsection is
# excluded (archive, not living architecture).
_SPEC_SECTIONS = (('2.2', 'skills'), ('2.3', 'agents'),
                  ('2.4', 'scripts'), ('2.5', 'docs'))


def _split_table_cells(line):
    """Split a markdown table row into cells; `\|` is an escaped pipe."""
    line = line.strip()
    if line.startswith('|'):
        line = line[1:]
    if line.endswith('|'):
        line = line[:-1]
    line = line.replace('\\|', '\x00')
    cells = [c.strip() for c in line.split('|')]
    return [c.replace('\x00', '|') for c in cells]


def _clean_cell(text):
    """Strip inline formatting from a cell (backticks, bold markers)."""
    return text.replace('`', '').replace('**', '').strip()


def _is_separator_row(line):
    return bool(re.match(r'^\s*\|?[\s\-:|]+\|?\s*$', line))


def _parse_tables(text):
    """Parse the markdown tables in text.

    Returns [{'start': line_index_in_text, 'header': [...], 'rows': [[...]]}].
    Tolerates `\|` escaped pipes and multi-line cells (a continuation line
    appends to the previous row's last cell).
    """
    tables = []
    lines = text.splitlines()
    i = 0
    n = len(lines)
    while i < n:
        if not lines[i].strip().startswith('|'):
            i += 1
            continue
        start = i
        header_cells = None
        rows = []
        while i < n:
            ln = lines[i]
            if ln.strip().startswith('|'):
                if _is_separator_row(ln):
                    i += 1
                    continue
                cells = _split_table_cells(ln)
                if header_cells is None:
                    header_cells = cells
                else:
                    rows.append(cells)
                i += 1
            elif ln.strip() and rows and not ln.strip().startswith(('#', '>')):
                # multi-line cell continuation of the previous row
                rows[-1][-1] = rows[-1][-1] + ' ' + ln.strip()
                i += 1
            else:
                break
        if header_cells is not None:
            tables.append({'start': start,
                           'header': [_clean_cell(c) for c in header_cells],
                           'rows': [[_clean_cell(c) for c in r] for r in rows]})
    return tables


def extract_arch_spec():
    """Parse architecture_mindmap.md §2.2 Skills / §2.3 Agents / §2.4 Scripts
    (excluding the 2.4.x legacy_scripts subsection) / §2.5 Documents into the
    architecture spec JSON injected into presentation/index.html.

    Returns {"skills": [...], "agents": [...], "scripts": [...], "docs": [...]}
    where each skills/agents/scripts item is
        {"name", "model", "one", "tables": [{"title", "header", "rows"}]}
    and each docs item is {"name", "path", "update", "contents"}.

    * Anchors: `#### 2.2.x <name>` headings (name may include ` — subtitle`).
    * `one` = short one-liner from the first Property table (Purpose →
      Responsibility → Model → Path row) or the first prose line under the
      heading.
    * `model` = the model word of the Model row (fable / haiku).
    * Extra 2–4 column tables under a heading are captured; their title is
      the bold paragraph directly above them.
    """
    global _arch_spec
    if _arch_spec is not None:
        return _arch_spec

    spec = {'skills': [], 'agents': [], 'scripts': [], 'docs': []}
    if not os.path.exists(_MINDMAP):
        _arch_spec = spec
        return spec
    with open(_MINDMAP, 'r', encoding='utf-8', errors='replace') as f:
        md = f.read()

    # --- section ranges: from `### 2.X <Name>` to the next `## ` heading ---
    head_starts = [m.start() for m in re.finditer(r'^## ', md, re.MULTILINE)]
    sections = {}
    for num, _kind in _SPEC_SECTIONS:
        sec = re.search(rf'^### {re.escape(num)} \S', md, re.MULTILINE)
        if not sec:
            continue
        limits = [p for p in head_starts if p > sec.start()]
        end = min(limits) if limits else len(md)
        sections[num] = md[sec.start():end]

    for num, kind in _SPEC_SECTIONS:
        block = sections.get(num)
        if block is None:
            continue

        if kind == 'docs':
            # §2.5 is a single 4-column table: Document / Path / Update
            # Method / Contents
            for t in _parse_tables(block):
                for row in t['rows']:
                    if len(row) >= 4:
                        spec['docs'].append({
                            'name': row[0], 'path': row[1],
                            'update': row[2], 'contents': row[3]})
            continue

        # --- per-component sub-blocks anchored on `#### 2.X.N <name>` ---
        anchor_re = re.compile(
            rf'^#### ({re.escape(num)}\.\d+)\s+(.+)$', re.MULTILINE)
        anchors = list(anchor_re.finditer(block))
        sub_blocks = []
        for i, m in enumerate(anchors):
            end = anchors[i + 1].start() if i + 1 < len(anchors) else len(block)
            sub_blocks.append((m.group(1), m.group(2).strip(), block[m.end():end]))

        for anchor, name, content in sub_blocks:
            if 'legacy_scripts' in name:
                continue  # §2.4.x legacy_scripts subsection — archive
            lines = content.splitlines()
            tables = _parse_tables(content)

            # Property table = first 2-column table with header Property/Value
            prop = None
            extras = []
            for t in tables:
                if prop is None and t['header'] == ['Property', 'Value']:
                    prop = t
                else:
                    extras.append(t)

            prop_rows = {}
            if prop is not None:
                prop_rows = {row[0]: row[1] for row in prop['rows']
                             if len(row) >= 2}

            model = ''
            if 'Model' in prop_rows:
                mm = re.match(r'[a-z][a-z0-9]*', prop_rows['Model'])
                if mm:
                    model = mm.group(0)

            one = ''
            for key in ('Purpose', 'Responsibility', 'Model', 'Path'):
                if prop_rows.get(key):
                    one = prop_rows[key]
                    break
            if not one:
                for ln in lines:
                    s = ln.strip()
                    if s and not s.startswith(('#', '|', '>', '**')):
                        one = s
                        break

            tables_out = []
            if prop is not None:
                tables_out.append({
                    'title': 'Property', 'header': prop['header'],
                    'rows': prop['rows']})
            for t in extras:
                title = None
                for j in range(t['start'] - 1, -1, -1):
                    s = lines[j].strip()
                    if not s:
                        continue
                    tm = re.match(r'^\*\*(.+)\*\*:?\s*$', s)
                    if tm:
                        title = tm.group(1).strip()
                    break
                tables_out.append(
                    {'title': title, 'header': t['header'], 'rows': t['rows']})

            spec[kind].append({
                'name': name,
                'model': model,
                'one': one,
                'tables': tables_out,
            })

    _arch_spec = spec
    return spec


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
#   * The four fact kinds added with the presentation-from-mindmap upgrade
#     come FIRST (priority order before the generic rules): "36 new BNF
#     productions" must never feed the generic "(\d+) BNF productions" rule.
#   * "new BNF productions" is limited to 1-3 digit counts: the 4-digit year
#     in "VHDL 2008 new BNF productions" (coverage report) must never match
#     (touchstone false-positive fix — the lookbehind alone blocks mid-number
#     starts but not the leading digit of "2008"; counts on this project's
#     scale are at most 3 digits).
#   * ANY rules: keys = ('ANY', fact_a, fact_b, ...) — the claim value must
#     equal at least one of the listed facts. Used for "(\d+) Iron Rules":
#     "6 Iron Rules" = CLAUDE.md's orchestration rules (iron_rules) and
#     "12 Iron Rules" = the vhdl-test-generator skill's content rules
#     (skill_iron_rules, live-counted from the skill's definition section).
#     Both are correct prose about different rule sets — a plain iron_rules
#     mapping would false-flag every "12 Iron Rules" occurrence, while a
#     stale value (e.g. the historical "5 Iron Rules") still fails the gate.
CLAIM_REGISTRY = (
    (re.compile(r'(?<![\w.])(\d{1,3}) new BNF productions'),
     'bnf_new_2008', 'VHDL 2008 new BNF productions'),
    (re.compile(r'(?<![\w.])(\d+) P0 semantic rules'),
     'sem_p0', 'P0-priority semantic rules'),
    (re.compile(r'(?<![\w.])(\d+) document kinds'),
     'doc_kinds', 'document kinds (mindmap §2.5 table rows)'),
    (re.compile(r'(?<![\w.])(\d+) Iron Rules'),
     ('ANY', 'iron_rules', 'skill_iron_rules'),
     'Iron Rules (CLAUDE.md orchestration rules or the vhdl-test-generator content rules)'),
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
