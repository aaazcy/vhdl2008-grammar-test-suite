-- =============================================================
-- Case ID: TC_CONTEXT_CLAUSE_SYN_002
-- Rule Type: Syntax
-- BNF Production: context_clause
-- IEEE Section: 13.2
-- BNF Text: context_clause ::= { context_item }
-- Test Focus: context_clause with multiple context_items (library + multiple use)
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tc_context_clause_syn_002 is
  port (
    vec_in  : in  std_logic_vector(3 downto 0);
    vec_out : out std_logic_vector(3 downto 0)
  );
end entity tc_context_clause_syn_002;

architecture rtl of tc_context_clause_syn_002 is
  signal s_shifted : unsigned(3 downto 0);
begin
  s_shifted <= unsigned(vec_in) + 1;
  vec_out   <= std_logic_vector(s_shifted);
end architecture rtl;
