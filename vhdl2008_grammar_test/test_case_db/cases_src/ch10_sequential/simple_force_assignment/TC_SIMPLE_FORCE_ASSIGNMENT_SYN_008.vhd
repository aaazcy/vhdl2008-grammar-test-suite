-- =============================================================
-- Case ID: TC_SIMPLE_FORCE_ASSIGNMENT_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_force_assignment ::= target <= force [ force_mode ] expression ;
-- Case Type: Positive
-- Test Focus: Multiple sequential force/release cycles on same target demonstrating force as overriding driver
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity simple_force_syn_008 is
end entity simple_force_syn_008;

architecture test of simple_force_syn_008 is
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
    wait for 5 ns;
    s_data <= force "1111";
    wait for 10 ns;
    s_data <= release;
    wait;
  end process;
end architecture test;
