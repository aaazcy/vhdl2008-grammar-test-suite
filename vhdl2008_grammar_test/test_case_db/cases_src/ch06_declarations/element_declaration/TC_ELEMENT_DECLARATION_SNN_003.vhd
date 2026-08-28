-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: element_declaration ::= identifier_list : element_subtype_definition ;
-- Case Type: Negative
-- Test Focus: element_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity element_declara_e3 is end entity;
architecture bh of element_declara_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;