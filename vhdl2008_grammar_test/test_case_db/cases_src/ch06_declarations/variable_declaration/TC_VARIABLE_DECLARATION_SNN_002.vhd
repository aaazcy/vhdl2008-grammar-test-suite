-- =============================================================
-- Case ID: TC_VARIABLE_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_VARIABLE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.4
-- Production: variable_declaration ::= [ shared ] variable identifier_list : subtype_indication [ := expression ] ;
-- Case Type: Negative
-- Test Focus: variable_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity variable_declar_e2 is end entity;
architecture bh of variable_declar_e2 is
  -- ERROR: invalid syntax in variable_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;