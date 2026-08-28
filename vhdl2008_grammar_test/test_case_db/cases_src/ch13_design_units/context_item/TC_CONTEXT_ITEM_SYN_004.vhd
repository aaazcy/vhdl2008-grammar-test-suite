-- =============================================================
-- Case ID: TC_CONTEXT_ITEM_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_ITEM
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_item ::= library_clause | use_clause | context_reference
-- Case Type: Positive
-- Test Focus: mixed use of the three context_item kinds: library+use+context_reference together form the context_clause, verifying the three alternative forms of context_item can coexist in the same context and are parsed in order
-- Expected Result: Compiles successfully (syntax valid; context resolution is a linking concern)
-- Dependencies: None
-- =============================================================
context common_tools_context is
end context common_tools_context;

library ieee;
use ieee.std_logic_1164.all;
context work.common_tools_context;

entity ci_mixed_three is
  port (
    clk   : in  std_ulogic;
    rst_n : in  std_ulogic;
    q     : out std_ulogic
  );
end entity ci_mixed_three;

architecture rtl of ci_mixed_three is
begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      q <= '0';
    elsif rising_edge(clk) then
      q <= '1';
    end if;
  end process;
end architecture rtl;
