# CLAUDE.md — VHDL 2008 Test Suite

## Your Role

You are the main agent for the VHDL 2008 grammar & semantic test suite project. Your job: generate high-quality, non-template VHD test files and keep all documentation in sync.

## Available Skills

Invoke these via `/skill-name`. Each has detailed methodology — CLAUDE.md does NOT duplicate skill content.

| Skill | When to Invoke | Model |
|---|---|---|
| `/vhdl-test-generator` | Generate or improve VHD test files for any BNF production | fable |
| `/doc-sync` | After ANY file change — sync all docs + verify consistency | haiku |
| `/quality-audit` | Audit generated files before marking done (audit procedure; criteria = 12 Iron Rules defined in `/vhdl-test-generator`) | haiku |
| `/ghdl-verify` | External GHDL verification gate — run suite, classify failures, fix, rerun to 0 non-allowlist FAIL | fable |

## Iron Rules (Non-Negotiable)

Mechanism per rule: **machine-enforced** = enforced by harness exit codes / hooks / gates; **harness reminder** = hook-injected context; **protocol reference** = enforced by the referenced skill protocol.

1. **Sync is mandatory** — machine-enforced + harness reminder. After any file change in `cases_src/`, invoke `/doc-sync`. Output must show `0 issues found`. Never skip. Never defer. Machine layer: the PostToolUse hook records every `cases_src/*.vhd` Edit/Write into `.claude/sync_pending.log`; the SessionStart hook runs `python sync_all.py --verify-only` at every session start (non-zero exit = unfinished work, injected as HARNESS GATE context); the Stop hook reminds about unsettled records; a passing verify auto-clears the log at the next SessionStart.

2. **Batch = track + complete** — protocol reference. Before batch work, read `PRODUCTION_TRACKER.md`. Process every target production. Invoke `/doc-sync` every ~5 productions.

3. **Quality is verified, not assumed** — protocol reference. Before reporting "done" on generated files, invoke `/quality-audit` on the production folder. Fix all violations before proceeding.

4. **Methodology lives in skills** — protocol reference (this rule itself is hard-coded in CLAUDE.md). The 12 Iron Rules, 5-layer thinking, 6-step work loop, error patterns, and category tables are defined in `/vhdl-test-generator` — the single source of truth. CLAUDE.md does not repeat them. Protocol text (sync protocol, audit procedure, GHDL fix loop) has exactly one definition in its skill file — CLAUDE.md and architecture_mindmap.md reference, never copy.

5. **External verification is part of the quality gate** — machine-enforced. After any .vhd change, invoke `/ghdl-verify` (full or scoped `--chapter`) and reach 0 non-allowlist FAILs. GHDL limitations must be explicitly allowlisted in `reports/ghdl_allowlist.csv` with a reason — never silently accepted. Then invoke `/doc-sync`. Machine layer: `verify_ghdl_gate()` runs in every `--verify-only` — any FAIL row fails the gate, and freshness is enforced (`ghdl_run_manifest.json` total vs current file count), so a stale run cannot masquerade as clean.

6. **Facts come from one source** — machine-enforced. Any factual claim (numbers, paths, architecture counts) written into any doc or template must come from `project_facts.py` compute_facts() or be added to CLAIM_REGISTRY; hardcoded fact literals in generator sources are verify failures (verify_fact_claims, step 7k); when a new claim type appears, add a registry entry (blind-spot sealing, claim domain). Machine layer: `verify_fact_claims()` runs in every `--verify-only` — output-side claims must equal the live facts, generator sources must be literal-free, and backticked filesystem claims (README.md, architecture_mindmap.md) must exist on disk.

**Generated-artifact governance** (extends Iron Rule 6): every generated artifact is classified in `reports/sync_manifest.json` as `direct` (pure data-driven) or `script-then-generate` (generator-owned structure/style/logic, protected by accepted style fingerprints). A deliberate style/logic change requires the explicit ritual `python sync_all.py --quick --accept-style-change` — the ONLY writer of the manifest refs — plus a commit explaining the change; verify otherwise reports `Style/logic drift` (verify_manifest + verify_style_stability, step 7m). Architecture component descriptions (skills/agents/scripts/docs) live ONLY in `architecture_mindmap.md` §2.2–§2.5 and are rendered into the presentation by `extract_arch_spec()` (project_facts.py) — hand-written component cards in `build_presentation.py` are a verify failure (verify_arch_spec, step 7l).

## Harness Enforcement Layer

`.claude/settings.json` + `.claude/hooks/*.py` turn Iron Rules 1/5 from model discipline into machine records and machine reminders (Iron Rule 6 is machine-enforced by `verify_fact_claims()`, step 7k, inside every `--verify-only`):

| Hook | Event | Job |
|---|---|---|
| `session_verify.py` | SessionStart (`startup/resume/clear/compact`) | Runs `python sync_all.py --verify-only` (read-only). Non-zero exit → injects HARNESS GATE context with the first 12 issues. 0 issues → auto-clears `sync_pending.log` (previous edits settled). |
| `log_case_edit.py` | PostToolUse (`Edit/Write/MultiEdit`) | Records every `cases_src/*.vhd` touch into `.claude/sync_pending.log` (deduped, timestamped) and injects the Iron Rule 1/5 reminder. |
| `check_pending.py` | Stop | Non-empty log → user-facing reminder to run /doc-sync + /ghdl-verify. |

`.claude/sync_pending.log` semantics: machine record of unsettled `cases_src` edits. Closed loop: Edit → log → Stop reminder → next SessionStart verify → pass = auto-clear. Project-layer scripts never read or write it (M-domain file).

Permissions principle (deliberate): `allow` contains only side-effect-free commands (`Read/Glob/Grep`, `Bash(pwd)`, `Bash(ls/dir/where)`, verify-only, read-only git). Write-class commands are NOT allowlisted — every confirmation prompt is the gate ritual. Render artifacts (`reports/architecture_mindmap.html`, `reports/index.html`) are owned by `architecture_mindmap.md` + the sync pipeline: they are regenerated only by `sync_all.py` / `generate_arch_pdf.py`, and agents must not hand-edit them (enforced by convention + the verify gate — NOT by deny rules, which in practice also blocked the sync subprocess commands that write these paths).

## Memory Policy

Memory stores only user preferences that cannot be derived from the repo. Iron Rules and architecture facts NEVER go into memory — storing them there would degrade machine-enforced gates into soft constraints. This policy is hard-coded in CLAUDE.md and is not overridable by any skill, agent, or session.

## Architect Team

Two specialist agents own the architecture. Dispatch them instead of doing architecture work inline:

| Agent | Dispatch When | Model |
|---|---|---|
| `project-architect` | User reports a problem or proposes a new requirement needing root scripts / pipelines / docs / verify gates changed | fable |
| `meta-architect` | Agent/skill behavior problems, new roles needed, optimization of the agent system itself (including `.claude/settings.json` + hooks) | fable |

Boundaries: project-architect never edits `.claude/` or CLAUDE.md; meta-architect never touches root scripts, cases_src, or the test plan. Both end with `python sync_all.py --verify-only` → exit 0 with `0 issues found` (machine gate, not prose) and keep the §8.5 debt chapter current.

## Key Paths

| Path | Purpose |
|---|---|
| `vhdl2008_grammar_test/test_case_db/cases_src/ch{NN}_*/` | Test files by chapter |
| `sync_all.py` | Unified sync script (the only entry point); `--verify-only` exit code is the machine gate: 0 = consistent, 1 = issues |
| `project_facts.py` | Single facts authority + CLAIM_REGISTRY — every factual claim (numbers/paths/architecture counts) in docs and templates derives from it |
| `PRODUCTION_TRACKER.md` | All 314 unique productions with status & file counts |
| `vhdl2008_grammar_test/test_plan/VHDL2008_Grammar_Semantic_Test_Plan.md` | Master test plan |
| `vhdl2008_grammar_test/reports/coverage_summary.md` | Coverage report (auto-generated) |
| `vhdl2008_grammar_test/reports/ghdl_failures.csv` + `ghdl_test_results.md` + `ghdl_allowlist.csv` | GHDL gate artifacts |
| `vhdl2008_grammar_test/reports/sync_manifest.json` | Generated-artifact policy registry (direct vs script-then-generate) + accepted style fingerprints — written only by the `--quick --accept-style-change` ritual |
| `vhdl2008_grammar_test/reports/index.html` | Reports portal — open offline |
| `presentation/` | Work-report page (index.html + assets/) — auto-rebuilt by sync (component cards rendered from `architecture_mindmap.md` via `extract_arch_spec()`), verified by snapshot + arch spec; LAN access via `serve_project.py` at `http://<IP>:8090/` |
| `.claude/settings.json` + `.claude/hooks/` | Harness enforcement layer (permissions + Iron Rule 1/5 hooks) |
| `.claude/sync_pending.log` | Machine record of unsettled cases_src edits — auto-cleared when verify passes |

## Scripts

| Script | Purpose |
|---|---|
| `sync_all.py` | **Primary** — sync all docs + tracker + report rendering + verify. `--verify-only` is the machine gate: exit 0 = consistent, exit 1 = issues. `--quick --accept-style-change` = the explicit style-change ritual (only writer of the sync_manifest.json refs) |
| `build_test_trace.py` | Regenerate Appendix E traceability matrix |
| `run_ghdl_suite.py` | Run the suite through GHDL (public analyzer) — SYN/SEM must pass, SNN/SMN must be rejected — **invoke via `/ghdl-verify`** |
| `generate_arch_pdf.py` | Report renderer — mindmap PDF + self-contained architecture HTML + `reports/index.html` portal (auto-called by sync) |
| `build_presentation.py` | Work-report presentation builder — dynamic data injection + PRESENTATION_SNAPSHOT marker + `{{ARCH_SPEC}}` injected from `extract_arch_spec()` over `architecture_mindmap.md` §2.2–§2.5 (auto-called by sync; verified by `verify_presentation()` + `verify_arch_spec()`) |
| `serve_project.py` | LAN web access (manual start, port 8090) — `/` fronts the presentation, `/browse/` browses/downloads any project file |
| `project_facts.py` | Single facts authority — compute_facts() + CLAIM_REGISTRY feed every factual claim in docs/templates; verified by verify_fact_claims() (step 7k) |

## Git

The project is a git repository. Commits happen only when the user asks; architects never commit their own work (the main agent accepts and commits). The verify gate must pass before any commit.
