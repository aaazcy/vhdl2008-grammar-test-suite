-- =============================================================
-- Case ID: TC_CONSTANT_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTANT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.1
-- Production: constant_declaration ::= constant identifier_list : subtype_indication [ := expression ] ;
-- Case Type: Negative
-- Test Focus: constant_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity constant_declar_e3 is end entity;
architecture bh of constant_declar_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;