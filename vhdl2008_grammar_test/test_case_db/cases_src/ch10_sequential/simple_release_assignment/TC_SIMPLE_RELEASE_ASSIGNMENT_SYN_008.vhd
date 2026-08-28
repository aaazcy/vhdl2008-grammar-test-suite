-- =============================================================
-- Case ID: TC_SIMPLE_RELEASE_ASSIGNMENT_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_RELEASE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_release_assignment ::= target <= release [ force_mode ] ;
-- Case Type: Positive
-- Test Focus: Release on a resolved std_logic signal with multiple drivers — release restores resolution
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity simple_release_syn_008 is
end entity simple_release_syn_008;

architecture test of simple_release_syn_008 is
  signal s_resolved : std_logic := '0';
begin
  driver_proc : process is
  begin
    s_resolved <= '0';
    wait;
  end process;

  test_proc : process is
  begin
    s_resolved <= force out '1';
    wait for 30 ns;
    s_resolved <= release out;
    wait;
  end process;
end architecture test;
