-- =============================================================
-- Case ID: TC_CONTEXT_ITEM_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONTEXT_ITEM
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: context_item ::= library_clause | use_clause | context_reference
-- Case Type: Positive
-- Test Focus: complete composite context_clause: library std; use std.standard.all; library ieee; use ieee.std_logic_1164.all; use ieee.numeric_std.all; context work.math_pkg_ctx; — verifying all three kinds of context_item interleave in the correct order in a complex context, with each alternative form appearing multiple times
-- Expected Result: Compiles successfully (syntax valid; context resolution is a linking concern)
-- Dependencies: None
-- =============================================================
context common_tools_context is
end context common_tools_context;

library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
context work.common_tools_context;

entity ci_full_combo is
  port (
    clk   : in  std_ulogic;
    rst_n : in  std_ulogic;
    din   : in  std_logic_vector(3 downto 0);
    dout  : out std_logic_vector(3 downto 0)
  );
end entity ci_full_combo;

architecture rtl of ci_full_combo is
  signal s_reg : unsigned(3 downto 0) := (others => '0');
begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      s_reg <= (others => '0');
    elsif rising_edge(clk) then
      s_reg <= unsigned(din);
    end if;
  end process;
  dout <= std_logic_vector(s_reg);
end architecture rtl;
