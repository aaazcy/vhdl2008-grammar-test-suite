-- =============================================================
-- Case ID: TC_SIMPLE_RELEASE_ASSIGNMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_RELEASE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_release_assignment ::= target <= release [ force_mode ] ;
-- Case Type: Positive
-- Test Focus: Simple release with explicit `release in` mode to match a prior `force in` assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity simple_release_syn_002 is
end entity simple_release_syn_002;

architecture test of simple_release_syn_002 is
  signal s_target : std_logic := '0';
begin
  process is
  begin
    s_target <= force in '1';
    wait for 5 ns;
    s_target <= release in;
    wait;
  end process;
end architecture test;
