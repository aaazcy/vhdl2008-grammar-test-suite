-- =============================================================
-- Case ID: TC_CONTEXT_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_declaration ::= context identifier is context_clause end [ context ] [ context_simple_name ] ;
-- Case Type: Negative
-- Test Focus: context_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity context_declara_e3 is end entity;
architecture bh of context_declara_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;