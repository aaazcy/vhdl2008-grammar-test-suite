-- =============================================================
-- Case ID: TC_CONTEXT_DECLARATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_declaration ::= context identifier is context_clause end [ context ] [ context_simple_name ] ;
-- Case Type: Positive
-- Test Focus: complete form with library+use+context_reference: the context contains all three kinds of context_item — verifying context_declaration supports the most complete context_clause with the full combination of library_clause/use_clause/context_reference
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
context ctx_leaf is
  library ieee;
  use ieee.std_logic_1164.all;
end context ctx_leaf;

context ctx_full is
  library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  context ieee.ieee_std_context;
end context ctx_full;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cd_full_ent is
  port(
    d : in  std_logic_vector(3 downto 0);
    q : out std_logic_vector(3 downto 0)
  );
end entity cd_full_ent;

architecture rtl of cd_full_ent is
  signal s_reg : unsigned(3 downto 0);
begin
  s_reg <= unsigned(d);
  q <= std_logic_vector(s_reg);
end architecture rtl;
