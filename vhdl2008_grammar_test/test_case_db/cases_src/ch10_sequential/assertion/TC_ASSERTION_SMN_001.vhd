-- =============================================================
-- Case ID: TC_ASSERTION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_ASSERTION_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Rule Description: Assert condition must be a boolean expression
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: assert with integer as condition instead of boolean
-- Expected Result: Triggers semantic error: condition must be boolean
-- Dependencies: None
-- =============================================================
entity assertion_smn1_ent is port(r:out integer); end entity;
architecture bh of assertion_smn1_ent is
  signal s_val:integer:=5;
begin
  assert s_val report "int condition" severity note;
  r<=s_val;
end architecture bh;
