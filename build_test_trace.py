#!/usr/bin/env python3
"""
Build VHDL Test Traceability Matrix (Appendix E)
Scans all chapter-organized test files and generates per-production
test point → file mapping tables in markdown.
"""
import os, csv, re
from datetime import datetime
from collections import defaultdict

# Paths derived from this file's location (repo root), never hardcoded
ROOT_DIR = os.path.dirname(os.path.abspath(__file__))
BASE = os.path.join(ROOT_DIR, 'vhdl2008_grammar_test')
CASES = os.path.join(BASE, 'test_case_db', 'cases_src')
now = datetime.now().strftime('%Y-%m-%d')

# IEEE chapter number → directory name + full title
CHAPTERS = {
    3:  ('ch03_design_entities',       'Design Entities and Configurations',       '3.1–3.4'),
    4:  ('ch04_subprograms_packages',   'Subprograms and Packages',                 '4.2–4.7'),
    5:  ('ch05_types',                  'Types',                                    '5.2–5.5'),
    6:  ('ch06_declarations',           'Declarations',                             '6.2–6.9'),
    7:  ('ch07_configuration',          'Configuration Specification',              '7.2–7.3'),
    8:  ('ch08_names',                  'Names',                                    '8.1–8.7'),
    9:  ('ch09_expressions',            'Expressions',                              '9.1–9.3'),
    10: ('ch10_sequential',             'Sequential Statements',                    '10.1–10.14'),
    11: ('ch11_concurrent',             'Concurrent Statements',                    '11.1–11.8'),
    12: ('ch12_scope',                  'Scope and Visibility',                     '12.4'),
    13: ('ch13_design_units',           'Design Units and Their Analysis',          '13.1–13.2'),
    15: ('ch15_lexical',                'Lexical Elements',                         '15.2–15.11'),
}

# Production-specific test strategies (hand-curated for key productions)
STRATEGIES = {
    'architecture_body': (
        'From minimal empty declarative part → rich types/subprograms/components/attributes → '
        'processes (clocked, wait-based, labeled) → generates (for/if/nested) → blocks (simple/guarded/nested) → '
        'dual architectures same entity → concurrent assertions → VHDL 2008 features → comprehensive all-in-one.'
    ),
    'entity_declaration': (
        'From ports-only minimal → ports with all modes (in/out/inout/buffer) → '
        'generics (integer/time/boolean defaults) → entity declarative part (types/signals/aliases) → '
        'entity statement part (passive processes/assertions) → full entity with generics+ports+passive body.'
    ),
    'process_statement': (
        'From minimal sensitivity-list process → process with declarations → '
        'wait-based process → labeled process → process with local variables.'
    ),
    'case_statement': (
        'From discrete choices on integer → range choices → others clause → '
        'enumeration type case → labeled case → VHDL 2008 matching case?.'
    ),
    'if_statement': (
        'From simple if-then-else → if-elsif chain → nested if → labeled if.'
    ),
    'loop_statement': (
        'From infinite loop with exit → for loop ascending → for loop descending → '
        'while loop → nested loops with labels → for loop on enumeration range.'
    ),
    'signal_assignment_statement': (
        'From simple <= → conditional when-else → selected with-select → '
        'transport delay → inertial delay → waveform with multiple elements.'
    ),
    'function_specification': (
        'From pure function with params → impure function → no-param function → '
        'array param → enum return → complex param types with default values.'
    ),
    'enumeration_type_definition': (
        'From basic user enum → character literal enum → enum as array index → '
        'enum as record field → single-element enum → pos/val/succ/pred attributes.'
    ),
    'array_type_definition': (
        'From 1D constrained ascending → 1D constrained descending → '
        '2D mixed directions → array of records → nested arrays.'
    ),
}

def extract_headers(filepath):
    """Extract Case ID, Test Focus, Case Type, Expected Result from VHD header."""
    info = {'focus': '', 'type': '', 'expected': ''}
    try:
        with open(filepath, 'r', encoding='utf-8', errors='replace') as f:
            for line in f:
                line = line.strip()
                if 'Test Focus:' in line:
                    info['focus'] = line.split('Test Focus:', 1)[1].strip()
                elif 'Case Type:' in line:
                    info['type'] = line.split('Case Type:', 1)[1].strip()
                elif 'Expected Result:' in line:
                    info['expected'] = line.split('Expected Result:', 1)[1].strip()
                if line.startswith('-- ====') and info['focus']:
                    break  # second header separator = end of header
    except:
        pass
    return info

def generate_appendix_e():
    """Generate the complete Appendix E markdown.

    Returns (markdown_text, stats_rows) where stats_rows are the machine-
    readable per-production rows for reports/traceability_stats.csv.
    """

    # Load BNF reference data
    bnf_path = os.path.join(BASE, 'test_case_db', 'reference', 'bnf_reference.csv')
    with open(bnf_path, 'r', encoding='utf-8-sig') as f:
        bnf_data = list(csv.DictReader(f, delimiter=';'))

    # Build lookup: bnf_id → (chapter_ref, production_text, is_2008_new)
    bnf_lookup = {}
    for r in bnf_data:
        bnf_lookup[r['bnf_id']] = (r['chapter_ref'], r['production_text'], r['is_2008_new'])

    # Scan all chapter folders and collect test files
    # Structure: {chapter_num: {folder_name: {'bnf_id': ..., 'files': [(fname, focus, type, expected), ...]}}}
    chapter_data = defaultdict(lambda: defaultdict(lambda: {'bnf_id': '', 'files': []}))

    for ch_num, (ch_dir, ch_title, ch_range) in CHAPTERS.items():
        ch_path = os.path.join(CASES, ch_dir)
        if not os.path.exists(ch_path):
            continue

        for folder in sorted(os.listdir(ch_path)):
            folder_path = os.path.join(ch_path, folder)
            if not os.path.isdir(folder_path):
                continue

            files = sorted([f for f in os.listdir(folder_path) if f.endswith('.vhd')])
            if not files:
                continue

            # Determine BNF ID from folder name
            bnf_id = f"BNF_{folder.upper()}"
            if bnf_id not in bnf_lookup:
                # Try fuzzy match
                for bid in bnf_lookup:
                    if bid.replace('BNF_', '').lower() == folder.lower():
                        bnf_id = bid
                        break

            chapter_data[ch_num][folder]['bnf_id'] = bnf_id

            for fname in files:
                fpath = os.path.join(folder_path, fname)
                info = extract_headers(fpath)
                ftype = info['type'] or ('SYN' if 'SYN' in fname else 'SNN' if 'SNN' in fname else '?')
                chapter_data[ch_num][folder]['files'].append((fname, info['focus'], ftype, info['expected']))

    # Generate markdown
    lines = []
    lines.append(f"# Appendix E: Production-Level Test Traceability Matrix")
    lines.append(f"")
    lines.append(f"**Generated on**: {now}")
    lines.append(f"**Total Productions**: {sum(len(v) for v in chapter_data.values())}")
    lines.append(f"")
    lines.append(f"---")
    lines.append(f"")

    section_num = 0
    total_rows = 0
    stats_rows = []  # [chapter, production, bnf_id, section, syn, snn, total, is_2008_new]

    for ch_num in sorted(chapter_data.keys()):
        ch_dir, ch_title, ch_range = CHAPTERS.get(ch_num, ('', '', ''))
        productions = chapter_data[ch_num]
        section_num += 1

        # Count files in this chapter
        ch_total_files = sum(len(v['files']) for v in productions.values())
        ch_syn = sum(sum(1 for _,_,t,_ in v['files'] if 'SYN' in t or 'Positive' in t) for v in productions.values())
        ch_snn = sum(sum(1 for _,_,t,_ in v['files'] if 'SNN' in t or 'Negative' in t) for v in productions.values())

        lines.append(f"## E.{section_num} Chapter {ch_num}: {ch_title} ({ch_range})")
        lines.append(f"")
        lines.append(f"**Productions**: {len(productions)} | **SYN files**: {ch_syn} | **SNN files**: {ch_snn} | **Total**: {ch_total_files}")
        lines.append(f"")

        prod_num = 0
        for folder in sorted(productions.keys()):
            data = productions[folder]
            bnf_id = data['bnf_id']
            files = data['files']

            if not files:
                continue

            prod_num += 1
            total_rows += len(files)

            # Get BNF info
            chapter_ref, prod_text, is_2008 = bnf_lookup.get(bnf_id, ('?.?', f'(See folder: {folder})', 'No'))

            # Section number from chapter_ref
            section = chapter_ref if chapter_ref else '?.?'

            # Clean production name for display
            prod_name = folder.replace('_', ' ')

            # Count file types
            syn_files = [(f, focus, t, e) for f, focus, t, e in files if 'SYN' in t or 'Positive' in t]
            snn_files = [(f, focus, t, e) for f, focus, t, e in files if 'SNN' in t or 'Negative' in t]

            # Machine-readable stats row (written to traceability_stats.csv in main)
            stats_rows.append([ch_num, folder, bnf_id, chapter_ref,
                               len(syn_files), len(snn_files), len(files),
                               'Yes' if is_2008 == 'Yes' else 'No'])

            # Strategy
            strategy = STRATEGIES.get(folder, '')
            strategy_note = f"\n\n**Test Strategy**: {strategy}" if strategy else ""

            # 2008 note
            note_2008 = " *(VHDL 2008 new)*" if is_2008 == 'Yes' else ""

            lines.append(f"### E.{section_num}.{prod_num} `{prod_name}`{note_2008} (Section {section})")
            lines.append(f"")
            lines.append(f"**BNF**:")
            lines.append(f"```")
            lines.append(f"  {prod_text}")
            lines.append(f"```")
            lines.append(f"")
            if strategy:
                lines.append(f"**Test Strategy**: {strategy}")
                lines.append(f"")
            # Complete classification (Phase 6 F1): files not classed as
            # SYN/SNN (e.g. SEM/SMN files without a Case Type header) must
            # still be accounted for — 9 productions had "X SYN + Y SNN =
            # Z total" with X+Y < Z. The remainder term is shown only when
            # non-zero, so the equation is self-consistent by construction.
            other_files = len(files) - len(syn_files) - len(snn_files)
            file_eq = f'{len(syn_files)} SYN + {len(snn_files)} SNN'
            if other_files:
                file_eq += f' + {other_files} other (SEM/SMN etc.)'
            lines.append(f"**Files**: {file_eq} = {len(files)} total")
            lines.append(f"")

            # SYN table
            if syn_files:
                lines.append(f"#### Positive Test Cases")
                lines.append(f"")
                lines.append(f"| # | Test Point | File | Focus |")
                lines.append(f"|---|---|---|---|")
                for i, (fname, focus, ftype, expected) in enumerate(syn_files):
                    focus_short = focus.replace(f'{folder}: ', '').replace(f'{folder}', '')[:80] if focus else '(see file)'
                    lines.append(f"| {i+1} | {focus_short[:60]} | `{fname}` | {focus_short} |")
                lines.append(f"")

            # SNN table
            if snn_files:
                lines.append(f"#### Negative Test Cases")
                lines.append(f"")
                lines.append(f"| # | Expected Error | File | Focus |")
                lines.append(f"|---|---|---|---|")
                for i, (fname, focus, ftype, expected) in enumerate(snn_files):
                    err_short = (expected or focus or 'see file').replace('Triggers error: ', '').replace('Triggers error in ', '')[:80]
                    focus_short = focus.replace(f'{folder}: ', '').replace(f'{folder}', '')[:70] if focus else err_short
                    lines.append(f"| {i+1} | {err_short[:60]} | `{fname}` | {focus_short} |")
                lines.append(f"")

            lines.append(f"---")
            lines.append(f"")

        lines.append(f"")

    # Summary footer
    lines.append(f"")
    lines.append(f"---")
    lines.append(f"")
    lines.append(f"**Total productions documented**: {sum(len(v) for v in chapter_data.values())}")
    lines.append(f"")
    lines.append(f"**Total test point mappings**: {total_rows}")
    lines.append(f"")
    lines.append(f"*End of Appendix E*")

    return '\n'.join(lines), stats_rows

def main():
    print("Generating Appendix E: Test Traceability Matrix...")

    appendix, stats_rows = generate_appendix_e()

    # Write to standalone file
    out_path = os.path.join(BASE, 'test_plan', 'Appendix_E_Traceability_Matrix.md')
    with open(out_path, 'w', encoding='utf-8') as f:
        f.write(appendix)

    # Count sizes
    lines = appendix.split('\n')
    print(f"Generated: {len(lines)} lines, {len(appendix)} characters")
    print(f"Output: {out_path}")

    # Compact machine-readable stats summary — data rows come from the same
    # generation loop as Appendix E itself (single source, no regex parsing)
    stats_path = os.path.join(BASE, 'reports', 'traceability_stats.csv')
    with open(stats_path, 'w', encoding='utf-8-sig', newline='') as f:
        w = csv.writer(f, delimiter=';')
        w.writerow(['chapter','production','bnf_id','section','syn_count','snn_count','total_files','is_2008_new'])
        w.writerows(stats_rows)

    print(f"Stats: {stats_path} ({len(stats_rows)} data rows)")
    print("Done.")

if __name__ == '__main__':
    main()
