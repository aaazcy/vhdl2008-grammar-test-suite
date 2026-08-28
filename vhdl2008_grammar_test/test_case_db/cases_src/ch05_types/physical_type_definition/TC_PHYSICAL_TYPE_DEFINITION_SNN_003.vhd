-- =============================================================
-- Case ID: TC_PHYSICAL_TYPE_DEFINITION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PHYSICAL_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_type_definition ::= range_constraint units primary_unit_declaration { secondary_unit_declaration } end units [ physical_type_simple_name ]
-- Case Type: Negative
-- Test Focus: physical_type_definition: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity physical_type_d_e3 is end entity;
architecture bh of physical_type_d_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;