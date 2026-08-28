-- =============================================================
-- Case ID: TC_LIBRARY_CLAUSE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 13.2
-- Production: library_clause ::= library logical_name_list ;
-- Case Type: Positive
-- Test Focus: library_clause as the preamble to use_clause: library ieee; use ieee.std_logic_1164.all; — first declaring library ieee via library_clause, then referencing that library via use_clause, verifying library_clause and use_clause combine in order as two independent context_items
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity lc_single_lib_use is
  port (
    clk : in  std_ulogic;
    q   : out std_ulogic
  );
end entity lc_single_lib_use;

architecture rtl of lc_single_lib_use is
begin
  process(clk)
  begin
    if rising_edge(clk) then
      q <= '1';
    end if;
  end process;
end architecture rtl;
