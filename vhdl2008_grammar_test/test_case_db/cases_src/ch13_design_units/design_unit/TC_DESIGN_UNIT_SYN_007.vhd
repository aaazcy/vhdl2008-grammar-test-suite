-- =============================================================
-- Case ID: TC_DESIGN_UNIT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_DESIGN_UNIT
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_unit ::= context_clause library_unit
-- Case Type: Positive
-- Test Focus: complete composite context_clause + primary_unit with all features: library std; use std.standard.all; library ieee; use ieee.std_logic_1164.all; use ieee.numeric_std.all; entity with generic, multiple ports, generated signals — verifying the combination of the most complex context_clause with the most complex primary_unit as a design_unit
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity du_full_ent is
  generic (
    DATA_WIDTH : positive := 16;
    USE_PIPE   : boolean  := false
  );
  port (
    clk     : in  std_ulogic;
    rst_n   : in  std_ulogic;
    valid_i : in  std_ulogic;
    data_i  : in  std_logic_vector(DATA_WIDTH-1 downto 0);
    data_o  : out std_logic_vector(DATA_WIDTH-1 downto 0);
    valid_o : out std_ulogic
  );
end entity du_full_ent;

architecture rtl of du_full_ent is
  signal s_data  : std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
  signal s_valid : std_ulogic := '0';
begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      s_data  <= (others => '0');
      s_valid <= '0';
    elsif rising_edge(clk) then
      s_data  <= data_i;
      s_valid <= valid_i;
    end if;
  end process;
  data_o  <= s_data;
  valid_o <= s_valid;
end architecture rtl;
