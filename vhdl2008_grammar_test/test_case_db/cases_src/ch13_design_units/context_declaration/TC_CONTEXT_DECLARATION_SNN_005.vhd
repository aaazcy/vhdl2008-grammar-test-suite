-- =============================================================
-- Case ID: TC_CONTEXT_DECLARATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_declaration ::= context identifier is context_clause end [ context ] [ context_simple_name ] ;
-- Case Type: Negative
-- Test Focus: SNN missing ";" semicolon terminator: end context ctx_no_semi — the end line of the context_declaration lacks the required semicolon, verifying the parser detects the missing terminating semicolon
-- Expected Result: Triggers syntax error: missing ";" after context declaration
-- Dependencies: None
-- =============================================================
context ctx_no_semi is
  library ieee;
  use ieee.std_logic_1164.all;
end context ctx_no_semi

entity cd_no_semi_ent is
  port(y: out bit);
end entity cd_no_semi_ent;

architecture rtl of cd_no_semi_ent is
begin
  y <= '0';
end architecture rtl;
