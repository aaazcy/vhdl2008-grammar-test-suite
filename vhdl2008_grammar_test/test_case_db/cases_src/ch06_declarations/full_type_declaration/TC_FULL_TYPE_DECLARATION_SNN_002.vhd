-- =============================================================
-- Case ID: TC_FULL_TYPE_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_FULL_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: full_type_declaration ::= type identifier is type_definition ;
-- Case Type: Negative
-- Test Focus: full_type_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity full_type_decla_e2 is end entity;
architecture bh of full_type_decla_e2 is
  -- ERROR: invalid syntax in full_type_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;