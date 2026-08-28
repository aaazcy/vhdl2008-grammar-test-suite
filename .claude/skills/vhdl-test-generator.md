---
name: vhdl-test-generator
description: Generate high-quality, non-template, production-specific VHDL test files for any BNF production. Each file tests ONE unique grammar point with deep understanding of the production syntax. Follows 12 iron rules for quality.
model: fable
---

# VHDL Test Generator Skill

Generate high-quality, production-specific VHDL 2008 test files for a given BNF production. Every file is hand-crafted with deep understanding — never batch-generated, never templated.

## When to Use

Invoke this skill when the user asks to:
- "generate the test set for entity_declaration"
- "complete the test suite for case_statement"
- "regenerate all files for ch05_types"
- Any request involving generating or improving VHDL test case files

## The 12 Iron Rules

**Single point of definition**: this file is the one complete definition of the 12 Iron Rules. Other skills/agents/CLAUDE.md/architecture_mindmap.md reference them by rule number only and never duplicate the text.

Every file must obey ALL of these rules. No exceptions.

### Content Rules

1. **One file = one unique test point**. Never "comprehensive test" catch-all.
2. **VHDL body exercises the target BNF production's actual syntax elements**. If testing `index_constraint`, the body must contain index constraints in array declarations — not a generic state machine.
3. **Entity/architecture names reflect test focus**. Good: `ent_gen` (generic entity), `case_match_ent` (matching case entity). Bad: `bh`, `comprehensive`, `result : out integer`.
4. **Port signatures vary by test**. Never default to `port(r:out integer)` for everything. Each entity gets ports relevant to what it tests.
5. **Zero dead declarations**. Every type/signal/constant/function declared must be used in the active code. No `t_uint8`/`t_state`/`t_vector`/`t_packet` template bloat.
6. **SNN errors come from specific BNF tokens**. Good: `architecture behav arch_snn1_ent is` (missing `of`). Bad: `-- ERROR: malformed production - missing keyword`.
7. **SNN files are parseable up to the error point**. Fix that one error and the code compiles. No empty stub bodies.
8. **Files show progressive complexity**. SYN_001 = minimal form (2-5 lines). SYN_002 = one variant. SYN_00N = comprehensive with all features combined.
9. **Real hardware design style**. VHDL reads like real designs — state machines, ALUs, memories, encoders — not test templates.

### Traceability Rules

10. **Header Test Focus describes HOW it tests**. Format: `[dimension]: [specific mechanism description]`. Good: `Minimal form: entity contains only the identifier and "is"; no generic, no port; end entity without identifier`. Bad: `tests entity_declaration`. Test Focus must not contain ASCII `|` (it breaks documentation tables — use the fullwidth vertical line U+FF5C instead); prefer English descriptions (other languages are acceptable but flagged in audit).
11. **Report must map HOW each file tests**. Test Plan entries match Header Test Focus verbatim.
12. **Three-layer consistency**: Report test point ↔ Header Test Focus ↔ VHDL body content. All three layers must align perfectly.

### Header Test Focus Examples

Good:
- `Minimal form: empty entity_declarative_part, no generic, no port, single-line end entity`
- `generic+port coexist: 3 generics (integer, time, boolean) + 5 ports (in/out/inout/buffer modes, types include custom record and array)`
- `SNN: missing "of" keyword — architecture behav arch_snn1_ent is (entity_name appears directly before is)`
- `SNN: unclosed — architecture only reaches begin y<=a; then end of file, no end`

Bad:
- `tests architecture_body` — doesn't say how
- `comprehensive type coverage with state machine` — generic template description
- `missing required keyword` — doesn't say which keyword or where

## Per-Production Work Loop

For each BNF production, follow this 6-step loop. Never skip any step.

### Step 1: Five-Layer Deep Thinking

Think through these five layers BEFORE writing any code:

**Layer 1 — Essence**: What role does this production play in VHDL? Standalone or embedded? What are the BNF syntax slots? What is the absolute minimal compilable form?

**Layer 2 — Variants**: What are the legal variants for each syntax slot? What complex but legal combinations exist? Edge cases (empty lists, single elements, maximum nesting)? What did VHDL 2008 add?

**Layer 3 — Types & Usage**: What types are involved? What custom types can enrich tests (integer with various ranges, enum with character literals, 1D/2D/constrained/unconstrained arrays, nested records, physical types with unit chains, floating types, access types, file types, protected types)? What contexts is this production used in? What other productions does it naturally combine with?

**Layer 4 — Error Modes**: For each BNF token, what errors can occur? Missing keywords, wrong delimiters, missing closing tokens, missing identifiers, wrong element order, type errors. What semantic rules are associated? What are the different violation paths for each rule?

**Layer 5 — Test Dimension List**: Synthesize layers 1-4 into a complete test dimension list:
- SYN dimensions (one file each, typically 8-25 for A-class, 4-10 for D-class)
- SNN dimensions (one file per BNF token error, typically 6-15 for A-class, 3-7 for D-class)
- SEM/SMN dimensions (one SEM + 2-3 SMN per semantic rule)

### Step 2: Write Test Dimension Table to Report

BEFORE generating files, write the test dimension table to the Test Plan. Each entry must describe HOW the file tests the production.

Format:
```
### {production_name} (Section {ieee_section})

BNF: {full_bnf_text}

SYN — positive syntax tests:
| # | File | How tested |
|---|------|--------|
| 001 | TC_{PROD}_SYN_001 | {specific test mechanism} |
...

SNN — negative syntax tests:
| # | File | How tested |
|---|------|--------|
| 001 | TC_{PROD}_SNN_001 | {specific error mechanism} |
...

SEM/SMN — semantic tests:
| Rule | File | How tested |
|------|------|--------|
| {RULE_ID}: {description} | {filename} | {how tested} |
```

### Step 3: Hand-Write Files One by One

Write each file individually, focusing on its unique test point. Follow the Header template below.

### Step 4: Three-Layer Consistency Check

For each file, verify: Report description = Header Test Focus = VHDL body content.

### Step 5: Iron Rule Audit

Run through the 12 iron rules for every file in the folder. Flag and fix any violations.

### Step 6: Refresh Documentation

Invoke the doc-sync skill to update all documentation and verify consistency:

```
/doc-sync "{production_name}: {summary of what was done}"
```

## File Header Template

```vhdl
-- =============================================================
-- Case ID: {case_id}
-- Rule Type: {Syntax|Semantic}
-- Related Rule ID: {BNF_PRODUCTION_NAME or SEM_RULE_ID}
-- Standard Reference: IEEE 1076-2008 Section {X.Y.Z}
-- Production: {full BNF production text}
-- Case Type: {Positive|Negative}
{-- Rule Description: {semantic rule description}}  (SEM/SMN only)
{-- Error Category: {error_category}}               (SMN only)
-- Test Focus: {specific HOW-it-tests description}
-- Expected Result: {Compiles successfully|Triggers {specific} error}
-- Dependencies: None
-- =============================================================
```

## Production Categories & File Counts

| Category | Characteristic | SYN | SNN | SEM/SMN | Total | Examples |
|---|---|---|---|---|---|---|
| A | Standalone compilation unit | 12-25 | 8-15 | 6-15 | 26-55 | entity, arch, process, if, case, loop |
| B | Declaration item | 8-16 | 6-12 | 4-12 | 18-40 | signal, variable, type, function_spec |
| C | Structure/container | 5-10 | 4-8 | 3-8 | 12-26 | decl_part, list, clause |
| D | Leaf syntax element | 4-10 | 3-7 | 1-5 | 8-22 | operator, range, direction, name |
| E | Lexical token | 3-6 | 2-5 | 0-2 | 5-13 | identifier, literal, character |

## SNN Error Pattern Reference

For each BNF token in the production, design specific errors:

| Error Type | Example | When to Use |
|---|---|---|
| Missing keyword 1 | `architecture behav arch_snn1_ent is` (missing `of`) | For the first mandatory keyword after identifier |
| Missing keyword 2 | `architecture behav of arch_snn3_ent begin` (missing `is`) | For the second mandatory keyword |
| Missing identifier | `architecture behav of is` (empty entity_name) | When an identifier slot exists |
| Missing closing token | `port(x:in integer` (missing `)`) | For parenthesized/braced constructs |
| Missing delimiter | `generic(A:integer B:boolean)` (missing `;`) | For lists with separators |
| Wrong element order | `architecture is ent_name of` | When BNF has strict ordering |
| Unclosed / EOF truncation | Architecture body without `end` | For constructs that require explicit closing |
| Invalid reference | Architecture referencing non-existent entity | For name resolution slots |
| Duplicate identifier | Two architectures with same name for one entity | When uniqueness rules apply |
| Extra/misplaced token | Keyword appearing in wrong position | When checking for illegal syntax |

## Key Paths

- Test cases: `vhdl2008_grammar_test/test_case_db/cases_src/ch{NN}_{chapter_name}/{production_name}/`
- BNF reference: `vhdl2008_grammar_test/test_case_db/reference/bnf_reference.csv`
- Semantic rules: `vhdl2008_grammar_test/test_case_db/reference/semantic_rules.csv`
- Test Plan: `vhdl2008_grammar_test/test_plan/VHDL2008_Grammar_Semantic_Test_Plan.md`

## Quality Checklist (Per Production)

After completing all files for a production, verify:

- [ ] Entity/architecture names reflect test focus (not `*_spc_ent` batch naming)
- [ ] Port signatures vary by test (not all `r:out integer`)
- [ ] Zero dead declarations — no unused types/signals/constants
- [ ] No `t_uint8`/`t_state`/`t_vector`/`t_packet` template bloat
- [ ] SNN errors come from specific BNF tokens, not generic "missing keyword"
- [ ] SNN files parseable up to error point
- [ ] Files show progressive complexity (SYN_001 minimal → SYN_00N comprehensive)
- [ ] Minimal test truly has only minimal necessary code
- [ ] Header has exact IEEE section + complete BNF text + specific Test Focus
- [ ] Three-layer consistency: Report ↔ Header ↔ Body
- [ ] Run `python3 sync_all.py --quick` after completion
