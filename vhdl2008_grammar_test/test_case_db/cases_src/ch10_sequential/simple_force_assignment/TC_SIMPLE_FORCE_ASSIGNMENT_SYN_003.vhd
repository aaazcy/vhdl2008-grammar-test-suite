-- =============================================================
-- Case ID: TC_SIMPLE_FORCE_ASSIGNMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_force_assignment ::= target <= force [ force_mode ] expression ;
-- Case Type: Positive
-- Test Focus: Simple force assignment with explicit force out mode to drive a port signal from within a process
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity simple_force_syn_003 is
  port (
    p_out : out std_logic
  );
end entity simple_force_syn_003;

architecture test of simple_force_syn_003 is
begin
  process is
  begin
    p_out <= force out 'Z';
    wait for 20 ns;
    p_out <= release out;
    wait;
  end process;
end architecture test;
