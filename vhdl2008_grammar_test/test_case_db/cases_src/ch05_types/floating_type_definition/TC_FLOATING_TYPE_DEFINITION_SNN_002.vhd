-- =============================================================
-- Case ID: TC_FLOATING_TYPE_DEFINITION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_FLOATING_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: floating_type_definition ::= range_constraint
-- Case Type: Negative
-- Test Focus: floating_type_definition: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity floating_type_d_e2 is end entity;
architecture bh of floating_type_d_e2 is
  -- ERROR: invalid syntax in floating_type_definition
  signal s : bit;
begin
  s <= '1'
end architecture bh;