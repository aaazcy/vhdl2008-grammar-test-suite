-- =============================================================
-- Case ID: TC_VARIABLE_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_VARIABLE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.4
-- Production: variable_declaration ::= [ shared ] variable identifier_list : subtype_indication [ := expression ] ;
-- Case Type: Negative
-- Test Focus: variable_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity variable_declar_e3 is end entity;
architecture bh of variable_declar_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;