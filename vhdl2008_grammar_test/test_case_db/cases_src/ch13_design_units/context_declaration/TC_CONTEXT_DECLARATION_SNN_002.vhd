-- =============================================================
-- Case ID: TC_CONTEXT_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_declaration ::= context identifier is context_clause end [ context ] [ context_simple_name ] ;
-- Case Type: Negative
-- Test Focus: context_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity context_declara_e2 is end entity;
architecture bh of context_declara_e2 is
  -- ERROR: invalid syntax in context_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;