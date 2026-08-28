-- =============================================================
-- Case ID: TC_SIMPLE_FORCE_ASSIGNMENT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_force_assignment ::= target <= force [ force_mode ] expression ;
-- Case Type: Positive
-- Test Focus: Force with out mode targeting a resolved std_logic signal driven by multiple processes, then release
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity simple_force_syn_007 is
end entity simple_force_syn_007;

architecture test of simple_force_syn_007 is
  signal s_resolved : std_logic := '0';
begin
  driver1 : process is
  begin
    s_resolved <= '0';
    wait for 100 ns;
  end process;

  driver2 : process is
  begin
    s_resolved <= force out '1';
    wait for 30 ns;
    s_resolved <= release out;
    wait for 70 ns;
  end process;
end architecture test;
