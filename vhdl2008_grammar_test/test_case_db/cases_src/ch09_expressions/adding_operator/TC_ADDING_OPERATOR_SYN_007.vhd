-- =============================================================
-- Case ID: TC_ADDING_OPERATOR_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ADDING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: adding_operator ::= + | - | &
-- Case Type: Positive
-- Test Focus: Three adding_operators used for different functions in one design - + for address increment, - for difference computation, & for bus concatenation, verifying the independent legal use of the three operators in the same architecture
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ent_all_three_ops is
  port (
    clk      : in  bit;
    addr_in  : in  unsigned(7 downto 0);
    base_val : in  unsigned(7 downto 0);
    upper    : in  std_logic_vector(3 downto 0);
    lower    : in  std_logic_vector(3 downto 0);
    addr_out : out unsigned(7 downto 0);
    diff_out : out unsigned(7 downto 0);
    bus_out  : out std_logic_vector(7 downto 0)
  );
end entity ent_all_three_ops;

architecture rtl of ent_all_three_ops is
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      addr_out <= addr_in + 1;        -- + for address increment
      diff_out <= addr_in - base_val; -- - for difference computation
      bus_out  <= upper & lower;      -- & for byte concatenation
    end if;
  end process;
end architecture rtl;
