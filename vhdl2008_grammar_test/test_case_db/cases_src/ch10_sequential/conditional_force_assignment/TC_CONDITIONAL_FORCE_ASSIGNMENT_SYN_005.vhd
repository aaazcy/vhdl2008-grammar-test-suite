-- =============================================================
-- Case ID: TC_CONDITIONAL_FORCE_ASSIGNMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Conditional force targeting std_logic_vector with comparison conditions on a select signal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cond_force_syn_005 is
end entity cond_force_syn_005;

architecture test of cond_force_syn_005 is
  signal s_bus  : std_logic_vector(7 downto 0) := X"00";
  signal s_addr : unsigned(3 downto 0) := "0000";
begin
  process is
  begin
    s_bus <= force X"FF" when s_addr > 7 else X"0F" when s_addr > 3 else X"00";
    wait for 20 ns;
    s_bus <= release;
    wait;
  end process;
end architecture test;
