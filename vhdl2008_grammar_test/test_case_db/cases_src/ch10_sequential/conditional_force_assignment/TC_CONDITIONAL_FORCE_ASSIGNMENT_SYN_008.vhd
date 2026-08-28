-- =============================================================
-- Case ID: TC_CONDITIONAL_FORCE_ASSIGNMENT_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Comprehensive conditional force with out mode on resolved signal using multiple when/else chains
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_force_syn_008 is
end entity cond_force_syn_008;

architecture test of cond_force_syn_008 is
  signal s_resolved : std_logic := '0';
  signal s_state    : std_logic_vector(1 downto 0) := "00";
begin
  driver : process is
  begin
    s_resolved <= '0';
    wait;
  end process;

  test : process is
  begin
    s_resolved <= force out '1' when s_state = "01" else '0' when s_state = "10" else 'Z' when s_state = "11" else '0';
    wait for 30 ns;
    s_resolved <= release out;
    wait;
  end process;
end architecture test;
