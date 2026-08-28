-- =============================================================
-- Case ID: TC_SCALAR_TYPE_DEFINITION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SCALAR_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: scalar_type_definition ::= enumeration_type_definition integer_type_definition | floating_type_definition | physical_type_definition
-- Case Type: Negative
-- Test Focus: scalar_type_definition: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity scalar_type_def_e3 is end entity;
architecture bh of scalar_type_def_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;