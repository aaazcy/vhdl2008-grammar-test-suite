-- =============================================================
-- Case ID: TC_SIMPLE_FORCE_ASSIGNMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_force_assignment ::= target <= force [ force_mode ] expression ;
-- Case Type: Positive
-- Test Focus: Simple force assignment with explicit force in mode targeting a std_logic signal with a literal value
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity simple_force_syn_002 is
end entity simple_force_syn_002;

architecture test of simple_force_syn_002 is
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
