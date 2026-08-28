-- =============================================================
-- Case ID: TC_SEM_2008_004_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_2008_004
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Rule Description: use_clause in a context declaration must reference an existing package
-- Case Type: Negative
-- Error Category: unresolved package
-- Test Focus: SMN: use_clause in a context declaration references a nonexistent package — no_such_pkg in use work.no_such_pkg.all inside context ctx_bad does not exist in library work and cannot be resolved during analysis
-- Expected Result: Triggers analysis error: unit "no_such_pkg" not found in library "work"
-- Dependencies: None
-- =============================================================
context ctx_bad is
  use work.no_such_pkg.all;
end context ctx_bad;
