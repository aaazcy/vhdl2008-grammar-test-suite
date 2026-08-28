---
name: doc-sync
description: After any file change, run sync_all.py to update all documents + tracker + architecture mindmap PDF/HTML + reports portal, then verify consistency. Must be invoked after every file generation, modification, or deletion. Also responsible for keeping architecture_mindmap.md in sync when .claude/ agents or skills change.
model: haiku
---

# Document Sync Skill

Keep all project documentation in sync with the filesystem. This skill is the **mandatory final step** after any file change in `cases_src/`.

**Single source of truth for the sync protocol**: this file is the one complete definition of the sync protocol (4-step protocol, issue fix table, report format). CLAUDE.md, sync-agent, and architecture_mindmap.md only reference this file and do not duplicate the protocol steps.

## When to Use

Invoke this skill:
- After generating, modifying, or deleting ANY `.vhd` file
- After any agent completes batch file generation
- When the user asks to "update docs" or "sync reports"
- Before reporting "done" on any task involving file changes

## Protocol (Do NOT Skip Steps)

### Step 1: Quick Sync

```bash
python3 sync_all.py --quick --message "brief description of what changed"
```

This updates:
- Test Plan: Sections 3.1, 5.3, 6.1-6.4, Appendix A, Appendix E
- Coverage Report: fully regenerated
- Section 9: per-production test point details refreshed
- PRODUCTION_TRACKER.md: Files column + Summary table
- Generation Log: timestamped entry appended
- architecture_mindmap.md: timestamp updated, verified against .claude/ files
- architecture_mindmap.pdf: auto-regenerated via mmdc + PyPDF2
- architecture_mindmap.html: self-contained inline-SVG HTML (offline)
- VHDL2008_Test_Plan_latest.html: auto-regenerated via generate_arch_pdf.py
- reports/index.html: reports portal (regenerated)
- presentation/index.html: work-report page — auto-rebuilt via build_presentation.py (dynamic data injection + PRESENTATION_SNAPSHOT marker; verify_presentation() checks the snapshot against disk)
- Test Plan §8.5 Known Issues / Technical Debt: hand-maintained — verified (heading exists, safe-zone, table shape, no verify-trap text) by verify_debt_chapter(); sync never rewrites it

### Step 2: Verify

```bash
python3 sync_all.py --verify-only
```

Output MUST show:
```
OK: All documents consistent with filesystem. 0 issues found.
```

### Step 3: If Issues Found

If verify reports issues, analyze and fix them immediately:

| Common Issue | Fix |
|---|---|
| `Tracker mismatch: X: tracker=N, actual=M` | Re-run --quick (tracker auto-updates) |
| `Sec9 mismatch` | Re-run --quick (Section 9 auto-regenerates) |
| `Header quality: MISSING Test Focus` | File header is broken — add `-- Test Focus:` line |
| `Header quality: contains ASCII pipe` | Replace `|` with the fullwidth vertical line U+FF5C in Test Focus |
| `Column mismatch` | Regenerate Section 9 — table format bug |
| `Test Plan total: N, actual: M` | Re-run --quick (patches auto-update) |
| `GHDL GATE: N failure(s)` | Invoke `/ghdl-verify` fix loop, rerun, then re-verify |
| `Architecture diagram out of date: skill/agent X not in diagram` | Update `reports/architecture_mindmap.md` to include the new skill/agent, then re-run sync |
| `Architecture diagram references non-existent skill/agent` | Remove stale reference from `reports/architecture_mindmap.md`, then re-run sync |
| `Architecture diagram missing script/concept token` | Update `reports/architecture_mindmap.md` (mermaid Scripts branch + §2.4 + §4), then re-run sync |
| `Debt chapter: heading missing / misplaced / malformed table / trap pattern` | Hand-edit §8.5 per its own rules (delete means done + migration log row), then re-run sync |
| `Presentation snapshot mismatch / stale / missing component name` | Re-run --quick (presentation auto-rebuilds from live data); if a component name is missing from the page, update the drill-down ARCH_GROUPS data in build_presentation.py, then re-run |

Then re-run Step 1 and Step 2 until clean.

### Step 4: Report

After successful verification, report:
- Files scanned: N
- Productions covered: N unique, N chapter entries
- Documents updated: list
- Verification: 0 issues

## Key Paths

| Path | Purpose |
|---|---|
| `sync_all.py` | Unified sync script (the only entry point) |
| `vhdl2008_grammar_test/test_plan/VHDL2008_Grammar_Semantic_Test_Plan.md` | Main test plan |
| `vhdl2008_grammar_test/reports/coverage_summary.md` | Coverage report |
| `vhdl2008_grammar_test/logs/generation.log` | Generation log |
| `PRODUCTION_TRACKER.md` | Production status tracker |
| `vhdl2008_grammar_test/reports/architecture_mindmap.html` | Self-contained architecture HTML (offline) |
| `vhdl2008_grammar_test/reports/index.html` | Reports portal |
| `vhdl2008_grammar_test/reports/ghdl_failures.csv` | GHDL failures (must be header-only) |
