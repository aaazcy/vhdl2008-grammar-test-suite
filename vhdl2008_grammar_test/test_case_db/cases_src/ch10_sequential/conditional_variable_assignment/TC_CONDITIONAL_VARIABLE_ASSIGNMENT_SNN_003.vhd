-- =============================================================
-- Case ID: TC_CONDITIONAL_VARIABLE_ASSIGNMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: conditional_variable_assignment ::= target := conditional_expressions ;
-- Case Type: Negative
-- Test Focus: conditional_variable_assignment: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity conditional_var_e3 is end entity;
architecture bh of conditional_var_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;