-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: library_clause ::= library logical_name_list ;
-- Case Type: Positive
-- Test Focus: complete library_clause combination: library std, ieee, work; use std.standard.all; use ieee.std_logic_1164.all; use ieee.numeric_std.all; use ieee.math_real.all; — the most complex library_clause (three-library comma list) plus the most use_clauses, verifying in production that library_clause holds multiple logical_names and coexists with multiple use_clauses
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library std, ieee, work;
use std.standard.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity lc_full_combo is
  generic (
    PIPELINE : boolean := true
  );
  port (
    clk   : in  std_ulogic;
    rst_n : in  std_ulogic;
    din   : in  std_logic_vector(7 downto 0);
    dout  : out std_logic_vector(7 downto 0)
  );
end entity lc_full_combo;

architecture rtl of lc_full_combo is
  signal s_data : std_logic_vector(7 downto 0) := (others => '0');
begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      s_data <= (others => '0');
    elsif rising_edge(clk) then
      s_data <= din;
    end if;
  end process;
  dout <= s_data;
end architecture rtl;
