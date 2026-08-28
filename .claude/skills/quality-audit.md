---
name: quality-audit
description: Audit generated VHD test files against the 12 Iron Rules. Checks for template bloat, header quality, progressive complexity, SNN error specificity, and three-layer consistency. Use before marking any test generation task as complete.
model: haiku
---

# Quality Audit Skill

Audit VHD test files for compliance with the 12 Iron Rules. This skill is the **mandatory quality gate** before any test generation task is considered "done."

**Single source of truth for rule definitions**: the complete definition of the 12 Iron Rules lives in `/vhdl-test-generator` (section "The 12 Iron Rules"). This skill contains only the audit procedure (sampling approach, check-dimension to rule-number mapping, audit script, report format) and does not duplicate the rule text.

## When to Use

- After generating files for a production
- Before reporting "done" on any test generation task
- When the user asks "check quality" or "audit this folder"
- On any folder suspected of containing template-generated files

## Audit Procedure

### Step 1 — Sample

Audit target = the production folder just generated/edited. Sample = **all** `.vhd` files in that folder — the quality gate covers every file, no random sampling.

### Step 2 — Check dimensions (rule mapping)

Check every file against the 12 Iron Rules. Dimension → rule-number mapping (rule text lives in `/vhdl-test-generator`, not here):

| Check dimension | Rule mapping (see /vhdl-test-generator) | Operational check |
|---|---|---|
| Header Quality | Rule 10 | Test Focus present and non-empty; describes HOW; no ASCII pipe; English preferred |
| Report Mapping | Rule 11 | Test Plan entry matches Header Test Focus verbatim (HOW mapping) |
| Three-Layer Consistency | Rule 12 | Report test point ↔ Header Test Focus ↔ VHDL body — three layers aligned |
| Template Bloat | Rules 3, 4, 5 | No bh/comprehensive/batch naming; ports not in a uniform default form; no t_* template types; no unused declarations |
| SNN Quality | Rules 6, 7 | Error points to a specific BNF token; parseable up to the error point, not an empty shell |
| Progressive Complexity | Rule 8 | SYN_001 minimal, SYN_00N most complete, increasing in between, no duplicate test points |
| VHDL Body Quality | Rules 1, 2, 9 | Body exercises the production's actual syntax elements; one file one test point; real hardware style |

### Step 3 — Mechanical pre-check script (not a full gate)

The script below does mechanical pattern scanning only (Test Focus shape, t_* type names, bh naming, default ports). **The script printing `OK` does NOT mean the audit passed** — most checkpoints in the Step 2 table have no script coverage and must be audited manually:

| Checkpoints without script coverage (must be audited manually) | Dimension |
|---|---|
| Whether Test Focus describes HOW (semantic judgment) | Header Quality |
| English preferred (language judgment) | Header Quality |
| Batch naming patterns (*_spc_ent etc.) | Template Bloat |
| No unused declarations (requires parsing the VHDL structure) | Template Bloat |
| SNN error points to a specific BNF token; parseable up to the error point | SNN Quality |
| SYN_001 minimal / SYN_00N most complete / increasing / no duplicate test points | Progressive Complexity |
| Body exercises the production's actual syntax; one file one test point; real hardware style | VHDL Body Quality |
| Test Plan entry matches Header Test Focus verbatim | Report Mapping |
| Report ↔ Header ↔ body three-layer alignment | Three-Layer Consistency |

Mechanical checks covered by the script: Test Focus missing/too short/contains ASCII pipe, `t_uint8`/`t_state`/`t_vector`/`t_packet` template types, `bh` entity/architecture names, default `port(r:out integer)`.

```bash
# Audit a specific production folder
python3 -c "
import os, re, sys
folder = sys.argv[1] if len(sys.argv) > 1 else '.'
issues = []
for fname in sorted(os.listdir(folder)):
    if not fname.endswith('.vhd'): continue
    fpath = os.path.join(folder, fname)
    with open(fpath, 'r', encoding='utf-8', errors='replace') as f:
        content = f.read()
    # Check Test Focus
    tf = re.search(r'-- Test Focus:\s*(.+)', content)
    if not tf:
        issues.append(f'{fname}: MISSING Test Focus')
    elif len(tf.group(1).strip()) < 15:
        issues.append(f'{fname}: Test Focus too short')
    elif '|' in tf.group(1):
        issues.append(f'{fname}: Test Focus contains ASCII pipe')
    # Check template bloat
    if re.search(r'\bt_uint8\b|\bt_state\b|\bt_vector\b|\bt_packet\b', content):
        issues.append(f'{fname}: contains template type names')
    if re.search(r'\bentity bh\b|\barchitecture bh\b', content):
        issues.append(f'{fname}: uses \"bh\" entity/architecture name')
    if re.search(r'port\s*\(\s*r\s*:\s*out\s+integer\s*\)', content):
        issues.append(f'{fname}: uses default port(r:out integer)')
if issues:
    print(f'{len(issues)} issue(s) found:')
    for i in issues: print(f'  - {i}')
else:
    print('OK: All files pass quality audit')
"
```

### Step 4 — Report

After auditing, report:
- Folder audited
- Files checked
- Issues found (categorized by dimension + rule number)
- Recommendation: PASS / FIX-N-ISSUES / REGENERATE

## External Verification Layer

Three independent gates, each with a distinct responsibility:
1. **Content audit** = this skill (`/quality-audit`) — header/template/specificity/complexity
2. **External compilation** = `/ghdl-verify` — GHDL 6.0 full compilation verification, four failure buckets (file bug / harness / GHDL limitation / metadata)
3. **Doc consistency** = `/doc-sync` — docs + reports consistent with the filesystem

When GHDL flags a file this skill passed, re-audit the file's header classification first (`-- Case Type:` vs filename markers) before touching the VHDL body — metadata mismatches are the cheapest fix.

## Key Paths

Same as doc-sync skill. The quality audit complements doc-sync — audit checks file content quality, sync checks documentation consistency.
