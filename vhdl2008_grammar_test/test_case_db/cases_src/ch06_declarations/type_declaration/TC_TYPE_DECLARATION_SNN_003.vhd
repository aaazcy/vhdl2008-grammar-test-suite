-- =============================================================
-- Case ID: TC_TYPE_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_declaration ::= full_type_declaration incomplete_type_declaration
-- Case Type: Negative
-- Test Focus: type_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity type_declaratio_e3 is end entity;
architecture bh of type_declaratio_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;