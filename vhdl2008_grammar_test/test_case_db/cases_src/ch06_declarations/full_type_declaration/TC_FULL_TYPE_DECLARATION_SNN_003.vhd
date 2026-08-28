-- =============================================================
-- Case ID: TC_FULL_TYPE_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FULL_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: full_type_declaration ::= type identifier is type_definition ;
-- Case Type: Negative
-- Test Focus: full_type_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity full_type_decla_e3 is end entity;
architecture bh of full_type_decla_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;