-- =============================================================
-- Case ID: TC_CONTEXT_DECLARATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_declaration ::= context identifier is context_clause end [ context ] [ context_simple_name ] ;
-- Case Type: Negative
-- Test Focus: SNN missing "is" keyword: context ctx_bad context_clause end; — the required "is" keyword is missing after the context keyword and identifier, verifying the parser detects the missing "is"
-- Expected Result: Triggers syntax error: missing "is" keyword
-- Dependencies: None
-- =============================================================
context ctx_bad
  library ieee;
  use ieee.std_logic_1164.all;
end context;

entity cd_no_is_ent is
  port(y: out bit);
end entity cd_no_is_ent;

architecture rtl of cd_no_is_ent is
begin
  y <= '0';
end architecture rtl;
