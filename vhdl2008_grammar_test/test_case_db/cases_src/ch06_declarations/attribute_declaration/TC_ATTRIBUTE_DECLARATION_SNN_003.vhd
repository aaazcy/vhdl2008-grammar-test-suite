-- =============================================================
-- Case ID: TC_ATTRIBUTE_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: attribute_declaration ::= attribute identifier : type_mark ;
-- Case Type: Negative
-- Test Focus: attribute_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity attribute_decla_e3 is end entity;
architecture bh of attribute_decla_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;