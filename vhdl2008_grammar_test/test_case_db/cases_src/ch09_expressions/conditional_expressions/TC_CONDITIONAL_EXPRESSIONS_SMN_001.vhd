-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_CONDITIONAL_EXPRESSIONS_BOOL_COND
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Negative
-- Rule Description: The condition in each when clause must be of boolean type.
-- Error Category: Non-boolean condition
-- Test Focus: SMN: condition is not of boolean type — y <= a when 42 else b; the condition must be of boolean type
-- Expected Result: Triggers type error: condition in when clause must be boolean
-- Dependencies: None
-- =============================================================

entity ent_ce_smn_001 is
  port (a, b : in integer);
end entity ent_ce_smn_001;

architecture non_bool_cond of ent_ce_smn_001 is
  signal y : integer;
begin
  -- ERROR: Condition must be boolean — integer cannot be used as condition
  y <= a when 42 else b;
end architecture non_bool_cond;
