-- =============================================================
-- Case ID: TC_CONSTANT_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTANT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.1
-- Production: constant_declaration ::= constant identifier_list : subtype_indication [ := expression ] ;
-- Case Type: Negative
-- Test Focus: constant_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity constant_declar_e2 is end entity;
architecture bh of constant_declar_e2 is
  -- ERROR: invalid syntax in constant_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;