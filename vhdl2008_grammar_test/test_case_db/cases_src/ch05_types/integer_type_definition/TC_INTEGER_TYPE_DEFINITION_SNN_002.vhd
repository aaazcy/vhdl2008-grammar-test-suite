-- =============================================================
-- Case ID: TC_INTEGER_TYPE_DEFINITION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTEGER_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: integer_type_definition ::= range_constraint
-- Case Type: Negative
-- Test Focus: integer_type_definition: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity integer_type_de_e2 is end entity;
architecture bh of integer_type_de_e2 is
  -- ERROR: invalid syntax in integer_type_definition
  signal s : bit;
begin
  s <= '1'
end architecture bh;