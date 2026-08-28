-- =============================================================
-- Case ID: TC_USE_CLAUSE_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_USE_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 12.4
-- Production: use_clause ::= use selected_name { , selected_name } ;
-- Case Type: Positive
-- Test Focus: Comma-separated multiple selected_names: use std.textio.all, ieee.std_logic_1164.all, ieee.numeric_std.all — verifies that one use_clause imports the .all of packages from three different libraries separated by commas
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
entity uc_multi_lib is
  port (
    clk   : in  bit;
    d_in  : in  bit_vector(3 downto 0);
    d_out : out bit_vector(3 downto 0)
  );
end entity uc_multi_lib;

architecture rtl of uc_multi_lib is
  use std.textio.all, ieee.std_logic_1164.all, ieee.numeric_std.all;
  signal s_reg : std_logic_vector(3 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_reg <= to_stdlogicvector(d_in);
    end if;
  end process;
  d_out <= to_bitvector(s_reg);
end architecture rtl;
