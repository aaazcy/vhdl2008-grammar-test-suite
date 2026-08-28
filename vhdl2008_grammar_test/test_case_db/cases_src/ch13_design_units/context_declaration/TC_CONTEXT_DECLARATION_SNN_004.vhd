-- =============================================================
-- Case ID: TC_CONTEXT_DECLARATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_declaration ::= context identifier is context_clause end [ context ] [ context_simple_name ] ;
-- Case Type: Negative
-- Test Focus: SNN missing "end" keyword: context ctx is context_clause context; — the context_declaration lacks the required "end" keyword, verifying the parser detects the unclosed context declaration
-- Expected Result: Triggers syntax error: missing "end" keyword
-- Dependencies: None
-- =============================================================
context ctx_no_end is
  library ieee;
  use ieee.std_logic_1164.all;
context ctx_no_end;

entity cd_no_end_ent is
  port(y: out bit);
end entity cd_no_end_ent;

architecture rtl of cd_no_end_ent is
begin
  y <= '0';
end architecture rtl;
