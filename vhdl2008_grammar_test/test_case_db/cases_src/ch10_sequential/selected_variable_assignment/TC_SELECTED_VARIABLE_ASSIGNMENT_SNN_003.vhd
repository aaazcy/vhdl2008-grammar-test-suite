-- =============================================================
-- Case ID: TC_SELECTED_VARIABLE_ASSIGNMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: selected_variable_assignment ::= with expression select [ ? ] target := selected_expressions ;
-- Case Type: Negative
-- Test Focus: selected_variable_assignment: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity selected_variab_e3 is end entity;
architecture bh of selected_variab_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;