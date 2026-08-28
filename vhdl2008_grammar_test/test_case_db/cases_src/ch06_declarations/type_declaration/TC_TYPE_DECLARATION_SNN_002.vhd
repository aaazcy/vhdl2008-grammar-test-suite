-- =============================================================
-- Case ID: TC_TYPE_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_declaration ::= full_type_declaration incomplete_type_declaration
-- Case Type: Negative
-- Test Focus: type_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity type_declaratio_e2 is end entity;
architecture bh of type_declaratio_e2 is
  -- ERROR: invalid syntax in type_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;