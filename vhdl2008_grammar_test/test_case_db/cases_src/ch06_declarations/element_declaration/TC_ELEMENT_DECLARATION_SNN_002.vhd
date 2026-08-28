-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: element_declaration ::= identifier_list : element_subtype_definition ;
-- Case Type: Negative
-- Test Focus: element_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity element_declara_e2 is end entity;
architecture bh of element_declara_e2 is
  -- ERROR: invalid syntax in element_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;