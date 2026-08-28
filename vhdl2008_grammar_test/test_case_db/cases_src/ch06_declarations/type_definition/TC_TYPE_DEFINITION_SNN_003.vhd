-- =============================================================
-- Case ID: TC_TYPE_DEFINITION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_definition ::= scalar_type_definition composite_type_definition | access_type_definition | file_type_definition | protected_type_definition
-- Case Type: Negative
-- Test Focus: type_definition: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity type_definition_e3 is end entity;
architecture bh of type_definition_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;