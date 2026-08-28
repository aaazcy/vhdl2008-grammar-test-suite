-- =============================================================
-- Case ID: TC_ATTRIBUTE_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: attribute_declaration ::= attribute identifier : type_mark ;
-- Case Type: Negative
-- Test Focus: attribute_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity attribute_decla_e2 is end entity;
architecture bh of attribute_decla_e2 is
  -- ERROR: invalid syntax in attribute_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;