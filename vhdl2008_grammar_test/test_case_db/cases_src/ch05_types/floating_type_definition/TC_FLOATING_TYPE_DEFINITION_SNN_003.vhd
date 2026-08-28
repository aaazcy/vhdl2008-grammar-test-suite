-- =============================================================
-- Case ID: TC_FLOATING_TYPE_DEFINITION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FLOATING_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: floating_type_definition ::= range_constraint
-- Case Type: Negative
-- Test Focus: floating_type_definition: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity floating_type_d_e3 is end entity;
architecture bh of floating_type_d_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;