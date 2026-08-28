-- =============================================================
-- Case ID: TC_OBJECT_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_OBJECT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2
-- Production: object_declaration ::= constant_declaration signal_declaration | variable_declaration | file_declaration
-- Case Type: Negative
-- Test Focus: object_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity object_declarat_e2 is end entity;
architecture bh of object_declarat_e2 is
  -- ERROR: invalid syntax in object_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;