-- =============================================================
-- Case ID: TC_CONDITIONAL_VARIABLE_ASSIGNMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: conditional_variable_assignment ::= target := conditional_expressions ;
-- Case Type: Negative
-- Test Focus: conditional_variable_assignment: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity conditional_var_e2 is end entity;
architecture bh of conditional_var_e2 is
  -- ERROR: invalid syntax in conditional_variable_assignment
  signal s : bit;
begin
  s <= '1'
end architecture bh;