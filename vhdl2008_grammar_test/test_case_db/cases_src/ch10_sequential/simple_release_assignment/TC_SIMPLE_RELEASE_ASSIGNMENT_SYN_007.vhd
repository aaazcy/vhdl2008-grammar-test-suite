-- =============================================================
-- Case ID: TC_SIMPLE_RELEASE_ASSIGNMENT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_RELEASE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_release_assignment ::= target <= release [ force_mode ] ;
-- Case Type: Positive
-- Test Focus: Multiple force/release cycles on same signal — verify release can be called repeatedly
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity simple_release_syn_007 is
end entity simple_release_syn_007;

architecture test of simple_release_syn_007 is
  signal s_data : std_logic_vector(3 downto 0) := "0000";
begin
  process is
  begin
    s_data <= force in "1010";
    wait for 10 ns;
    s_data <= release in;
    wait for 5 ns;
    s_data <= force out "0101";
    wait for 15 ns;
    s_data <= release out;
    wait;
  end process;
end architecture test;
