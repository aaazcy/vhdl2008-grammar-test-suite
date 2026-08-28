-- =============================================================
-- Case ID: TC_ACCESS_TYPE_DEFINITION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACCESS_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.4.1
-- Production: access_type_definition ::= access subtype_indication
-- Case Type: Negative
-- Test Focus: access_type_definition: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity access_type_def_e3 is end entity;
architecture bh of access_type_def_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;