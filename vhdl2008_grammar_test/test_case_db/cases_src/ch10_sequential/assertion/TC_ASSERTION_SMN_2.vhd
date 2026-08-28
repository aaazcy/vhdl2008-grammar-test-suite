-- =============================================================
-- Case ID: TC_ASSERTION_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_ASSERTION_SEVERITY
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Rule Description: Severity expression in assertion must be of type severity_level
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: severity expression returns integer instead of severity_level
-- Expected Result: Triggers semantic error: severity type mismatch
-- Dependencies: None
-- =============================================================
entity assertion_sem1_ent is port(r:out integer); end entity;
architecture bh of assertion_sem1_ent is
  signal s_val:integer:=0;
begin
  assert s_val>=0 report "check failed" severity 0;
  r<=s_val;
end architecture bh;
