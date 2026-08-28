# VHDL Test Suite — Deep-Customized High-Quality Regeneration Per Production

## Core Principles

Every BNF production is unique. The architecture_body pattern must not be mechanically applied to other productions.

## Iron Rules (12)

### File Content Iron Rules
1. Each file tests one precise, unique test point
2. The VHDL body actually exercises the syntax elements of the target production
3. Entity/architecture names reflect the test focus
4. Port signatures vary across tests
5. Zero dead declarations — every declaration is actually used in the code
6. SNN errors come from BNF tokens, not a generic "missing keyword"
7. SNN is parseable before the error point
8. Progressive complexity across files
9. Real hardware design style

### Traceability Iron Rules
10. **Header precisely describes "how it is tested"**: the Test Focus field must spell out the concrete test mechanism — which VHDL constructs, which types, which modes, which boundary cases are used. Not "tests architecture_body", but "minimal architecture: empty declarative part, single concurrent signal assignment `y<=a`, verifying that all optional BNF clauses can be omitted"
11. **Report precisely maps "how it is tested"**: every test point entry in the Test Plan must exactly match the Test Focus field in the corresponding file header
12. **Three-layer consistency**: report test point ↔ file header Test Focus ↔ actual VHDL body content — the three layers must be fully aligned

### Header Test Focus Specification

Test Focus format: `[test dimension category]: [description of the concrete test mechanism]`

Good Test Focus examples:
- `Minimal form: empty entity_declarative_part, no generic, no port, single-line end entity`
- `Rich type declarations: custom integer(0-255)/enum(IDLE,RUN,STOP)/array(0..7 of bit)/record(a:integer;b:bit), defined in the declarative part and then used by a concurrent assignment`
- `generic+port coexistence: 3 generics (integer,time,boolean) + 5 ports (in/out/inout/buffer modes, types include a custom record and array)`
- `SNN: missing "of" keyword — architecture behav arch_snn1_ent is (entity_name appears directly before is)`
- `SNN: unclosed — architecture runs only up to begin y<=a; then end of file, no end`

Bad Test Focus examples:
- `tests architecture_body` (does not say how it is tested)
- `comprehensive type coverage with state machine` (generic template description)
- `missing required keyword` (does not say which keyword, or where it is missing)

## Per-Production Work Loop

```
 ┌─────────────────────────────────────────────────────────────────┐
 │                                                                 │
 │   1. Five-layer deep thinking                                   │
 │      Essence → variant expansion → types/usage → error patterns │
 │                                ↓                                │
 │   2. Test dimension checklist                                   │
 │      List every dimension; note "how it is tested" for each     │
 │                                ↓                                │
 │   3. Write into the report  ←  do not skip                      │
 │      Put each point's "how it is tested" into the Test Plan     │
 │                                ↓                                │
 │   4. Hand-write each file                                       │
 │      VHD body implements "how"; header records "how"            │
 │                                ↓                                │
 │   5. Three-layer consistency verification                       │
 │      Report description = Header Test Focus = VHD body content  │
 │                                ↓                                │
 │   6. refresh_docs.py --quick                                    │
 │                                                                 │
 └─────────────────────────────────────────────────────────────────┘
```

## Report Format: the Production Test Dimension Table in the Test Plan

Each production has a **test dimension table** in the Test Plan, recording the **complete "how it is tested" information**:

```
### entity_declaration (Section 3.2.1)

BNF: entity identifier is entity_header entity_declarative_part
      [begin entity_statement_part] end [entity] [identifier];

SYN — positive syntax tests:

| # | File | How it is tested |
|---|------|--------|
| 001 | TC_ENTITY_DECLARATION_SYN_001 | Minimal form: entity contains only the identifier and "is" — no generic, no port, no declarative part, no statement part, `end entity` without identifier — tests that every optional clause in the BNF can be omitted |
| 002 | TC_ENTITY_DECLARATION_SYN_002 | Generic with all types: 4 generics using integer (range + initial value), time (initial value), bit (initial value), string (initial value), verifying the various subtype_indications and default expressions of interface_constant_declaration in a generic_clause |
| 003 | TC_ENTITY_DECLARATION_SYN_003 | Port with all modes: 5 ports using in/out/inout/buffer/linkage modes, types including integer, bit, and a custom enum(t_state), verifying full mode coverage of interface_signal_declaration in a port_clause |
| ... | ... | ... |

SNN — negative syntax tests:

| # | File | How it is tested |
|---|------|--------|
| 001 | TC_ENTITY_DECLARATION_SNN_001 | Missing "is": `entity bad_ent port(x:in bit); end entity;` — port appears where "is" should be, verifying that the parser distinguishes the separating keyword between entity_header and entity_declarative_part |
| 002 | TC_ENTITY_DECLARATION_SNN_002 | Missing entity_name: `entity is port(x:in bit); end entity;` — "is" immediately follows the "entity" keyword, verifying that the parser requires entity_name to be non-empty |
| 003 | TC_ENTITY_DECLARATION_SNN_003 | Generic missing ";": `generic(A:integer:=1 B:boolean:=true)` — no semicolon between the two generic declarations, verifying the separator requirement in generic_list |
| ... | ... | ... |

SEM/SMN — semantic tests:

| Rule | File | How it is tested |
|------|------|--------|
| ENT_001: entity name unique | TC_SEM_ENT_001_SEM_001 | Positive: 2 entities with different names (ent_a, ent_b), 2 architectures each referencing correctly — verifies that entities with different names may coexist legally |
| ENT_001: entity name unique | TC_SEM_ENT_001_SMN_001 | Negative: 2 entities with the same name (ent_dup) in the same design file — verifies that the duplicate name is detected as declaration_elaboration_error |
| ENT_001: entity name unique | TC_SEM_ENT_001_SMN_002 | Negative: the entity name is the same as a package name in the same library — verifies name-conflict detection across design units |
| ENT_002: port name unique | TC_SEM_ENT_002_SEM_001 | Positive: 5 ports in the entity with distinct names (clk, rst, din, dout, addr) — verifies compilation passes when there are no duplicate names |
| ENT_002: port name unique | TC_SEM_ENT_002_SMN_001 | Negative: entity with port(clk:in bit; clk:out bit) — both ports are named clk, verifying that duplicate port names are detected |
| ENT_002: port name unique | TC_SEM_ENT_002_SMN_002 | Negative: a port name is the same as a generic name — port(data:in bit) and generic(data:integer) share a name, verifying name-space detection across clauses |
| ... | ... | ... |
```

**Key point**: the text in the "how it is tested" column of the report must be **verbatim identical** to the Test Focus field in the corresponding VHD file header, and the VHD body content must **actually implement** the described behavior.

## Step 1: Five-Layer Deep Thinking

**Layer 1: production essence** — role? standalone/embedded? BNF syntax slot? minimal form?

**Layer 2: variant expansion** — legal variants of each slot? complex combinations? boundary cases? new in VHDL 2008?

**Layer 3: types and usage** — which types are involved? which custom types are available? used in which context? naturally combined with which productions?

**Layer 4: error patterns** — the error type for each BNF token? which semantic rules are associated? the different violation paths for each rule?

**Layer 5: test dimension checklist** — synthesizing the first four layers, list all SYN/SNN/SEM/SMN dimensions, **each dimension accompanied by a "how it is tested" description**

## Production Classification and Scale

| Category | Characteristics | Typical file count | Examples |
|---|---|---|---|
| A | Standalone compilation units | 30-55 | entity, arch, process, if, case, loop |
| B | Declaration items | 20-40 | signal, variable, type, function_spec |
| C | Structures/containers | 12-25 | decl_part, list, clause |
| D | Leaf syntax elements | 8-20 | operator, range, direction, name |
| E | Lexical tokens | 5-12 | identifier, literal, character |

## Execution Plan

### Phase 1: Core framework — ch10 → ch11 → ch03
Sequential statements + concurrent statements + design entities.
**ch03 starts with architecture_body**: five-layer thinking → add the missing dimensions (unconstrained ports, multi-level configuration binding, guarded disconnect, group, external names, minimal `end;`, etc.) → fix SEM/SMN bloat and mismatches → rewrite the header Test Focus into precise "how it is tested" descriptions.

### Phase 2: Declarations and types — ch06 → ch05 → ch04

### Phase 3: Configuration and names — ch07 → ch08 → ch12

### Phase 4: Expressions and lexical elements — ch09 → ch13 → ch15

## Legacy File Handling

- **architecture_body**: go through the full loop — deep thinking → add dimensions → fix → rewrite header → generate
- **the other 318 folders**: delete template files and replace pseudo-specific files
