-- =============================================================
-- Case ID: TC_INCOMPLETE_TYPE_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_INCOMPLETE_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: incomplete_type_declaration ::= type identifier ;
-- Case Type: Negative
-- Test Focus: incomplete_type_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity incomplete_type_e2 is end entity;
architecture bh of incomplete_type_e2 is
  -- ERROR: invalid syntax in incomplete_type_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;