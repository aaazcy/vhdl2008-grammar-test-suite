-- =============================================================
-- Case ID: TC_CONTEXT_DECLARATION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_CONTEXT_DUPLICATE_NAME
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_declaration ::= context identifier is context_clause end [ context ] [ context_simple_name ] ;
-- Case Type: Negative
-- Rule Description: two context_declarations with the same name cannot exist within the same scope
-- Error Category: duplicate declaration - same-named context
-- Test Focus: SMN duplicate context declaration: two contexts both named ctx_dup — verifying the semantic analyzer detects the duplicate context declaration
-- Expected Result: Triggers semantic error: duplicate context declaration
-- Dependencies: None
-- =============================================================
context ctx_dup is
  library ieee;
  use ieee.std_logic_1164.all;
end context ctx_dup;

context ctx_dup is
  library ieee;
  use ieee.numeric_std.all;
end context ctx_dup;

entity cd_dup_ent is
  port(y: out bit);
end entity cd_dup_ent;

architecture rtl of cd_dup_ent is
begin
  y <= '0';
end architecture rtl;
