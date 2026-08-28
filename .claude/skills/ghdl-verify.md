---
name: ghdl-verify
description: External GHDL verification gate. Runs run_ghdl_suite.py over cases_src, classifies every failure (file bug / harness bug / GHDL limitation / metadata), fixes files or extends the allowlist with a reason, reruns until 0 non-allowlist FAIL, then invokes /doc-sync.
model: fable
---

# GHDL Verify Skill

## When to Use

- After ANY `.vhd` change (Iron Rule 5: external verification is part of the quality gate)
- When `sync_all.py --verify-only` reports `GHDL GATE:` issues
- Before marking any generation task "done"
- On demand: "run GHDL" / "verify externally" / "run a pass"

## Protocol

### Step 1 — Ensure GHDL reachable

`run_ghdl_suite.py` auto-discovers GHDL via `find_ghdl()`: `shutil.which('ghdl')` → glob `%LOCALAPPDATA%\Microsoft\WinGet\Packages\ghdl*/bin/ghdl.exe` and pick the newest version → if none is found, print `ERROR: ghdl not found ... Install: winget install ghdl.ghdl.ucrt64.mcode` and exit. At runtime it automatically adds the bin directory and `..\lib` (libghdl DLL) to PATH. Run it directly — no manual configuration needed.

Smoke check: `python3 run_ghdl_suite.py --limit 1`.
If "ghdl not found": `winget install ghdl.ghdl.ucrt64.mcode`, then open a NEW shell (PATH is updated only for new shells).

### Step 2 — Run the suite

- Full: `python3 run_ghdl_suite.py`
- Scoped (after chapter edits): `python3 run_ghdl_suite.py --chapter ch05_types`
- Smoke: `python3 run_ghdl_suite.py --limit 20`

### Step 3 — Read the results

- `reports/ghdl_failures.csv` — ONLY FAIL rows (header-only = all clear)
- `reports/ghdl_test_results.md` — By-Type/By-Chapter matrix + Notes section (WARN_REJECT, EXPECTED_FAIL counts)
- Console summary

### Step 4 — Classify each failure into exactly ONE of 4 buckets

1. **Test-file bug** — the VHDL violates IEEE 1076-2008 or contradicts its own header → fix the `.vhd` (per `/vhdl-test-generator` rules).
2. **Harness bug** — `run_ghdl_suite.py` misclassifies/mis-orders → report to main agent (patch script).
3. **GHDL limitation** — matches the catalog below → append to `reports/ghdl_allowlist.csv`: `relpath,GHDL 6.0 <limitation>`. Every row MUST have a reason.
4. **Classification/metadata mismatch** — header `-- Case Type:` contradicts filename markers (Negative+SEM→SMN, Positive+SNN→SYN) → fix the header.

**Prefer fixing the file over allowlisting**; allowlist only genuine tool gaps.

### Step 5 — Fix

Apply the bucket-specific fix. Batch edits follow Iron Rules 2-3.

### Step 6 — Rerun until 0 FAIL

Loop Steps 2-5 until `Failures: 0`. WARN_REJECT and EXPECTED_FAIL are allowed (documented in the Notes section of ghdl_test_results.md).

### Step 7 — /doc-sync

Invoke `/doc-sync`; `--verify-only` must show 0 issues (GHDL gate included).

## Known GHDL 6.0 Limitation Catalog

(from `reports/ghdl_allowlist.csv`, 156 rows / ~25 categories)

| Limitation | Rows | Typical productions |
|---|---|---|
| force assignment (VHDL-2008) | 39 | ch10 sequential |
| vunit support | 21 | compound_configuration_specification |
| vunit binding support | 16 | compound_configuration_specification |
| default verification unit binding | 11 | configuration_declaration |
| record resolution subtype indication (internal error) | 9 | record_resolution |
| record element resolution (internal error) | 8 | record_element_resolution |
| force mode | 8 | ch10 sequential |
| release assignment | 7 | ch10 sequential |
| resolution indication (internal error) | 7 | resolution_indication |
| custom tool directives | 5 | tool_directive |
| generic subprogram instantiation | 4 | subprogram_instantiation_declaration |
| matching operators `?= ?/=` | 3 | matching operators |
| generic type conversion | 3 | signature |
| pipe-separated choices in selected assignment | 2 | selected assignment |
| record constraints / record element constraints | 2 / 1 | record_constraint, record_element_constraint |
| enum literal alias signature (REVIEW) | 2 | architecture_body, alias_declaration |
| scalar `'range` attribute | 1 | range |
| array element resolution | 1 | array_element_resolution |
| `??` operator for arrays | 1 | matching operators |
| char literal group constituent parser gap | 1 | group_constituent |
| interface type definition parser gap | 1 | interface_element |
| generic map (default) gap | 1 | interface_package_generic_map_aspect |
| attribute spec in protected type | 1 | protected_type_declarative_item |

## Key Paths

| Path | Purpose |
|---|---|
| `run_ghdl_suite.py` | Suite runner (2-pass: `ghdl -s` + `ghdl -a --std=08`) |
| `vhdl2008_grammar_test/reports/ghdl_failures.csv` | FAIL rows only — must be header-only |
| `vhdl2008_grammar_test/reports/ghdl_test_results.md` | Results matrix + Notes |
| `vhdl2008_grammar_test/reports/ghdl_allowlist.csv` | Allowed limitations (relpath + reason) |
