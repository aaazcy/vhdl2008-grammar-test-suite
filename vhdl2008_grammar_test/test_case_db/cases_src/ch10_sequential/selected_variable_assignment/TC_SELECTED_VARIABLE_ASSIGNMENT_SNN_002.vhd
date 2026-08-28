-- =============================================================
-- Case ID: TC_SELECTED_VARIABLE_ASSIGNMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: selected_variable_assignment ::= with expression select [ ? ] target := selected_expressions ;
-- Case Type: Negative
-- Test Focus: selected_variable_assignment: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity selected_variab_e2 is end entity;
architecture bh of selected_variab_e2 is
  -- ERROR: invalid syntax in selected_variable_assignment
  signal s : bit;
begin
  s <= '1'
end architecture bh;