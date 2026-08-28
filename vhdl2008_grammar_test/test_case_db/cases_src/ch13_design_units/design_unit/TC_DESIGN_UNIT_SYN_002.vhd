-- =============================================================
-- Case ID: TC_DESIGN_UNIT_SYN_002
-- Rule Type: Syntax
-- BNF Production: design_unit
-- IEEE Section: 13.1
-- BNF Text: design_unit ::= context_clause library_unit
-- Test Focus: design_unit with context_clause importing packages, entity uses package types
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- context_clause
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- library_unit (primary)
entity tc_design_unit_syn_002 is
  port (
    clk   : in  std_logic;
    rst_n : in  std_logic;
    cnt   : out std_logic_vector(3 downto 0)
  );
end entity tc_design_unit_syn_002;

-- library_unit (secondary)
architecture rtl of tc_design_unit_syn_002 is
  signal s_count : unsigned(3 downto 0) := (others => '0');
begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      s_count <= (others => '0');
    elsif rising_edge(clk) then
      s_count <= s_count + 1;
    end if;
  end process;
  cnt <= std_logic_vector(s_count);
end architecture rtl;
