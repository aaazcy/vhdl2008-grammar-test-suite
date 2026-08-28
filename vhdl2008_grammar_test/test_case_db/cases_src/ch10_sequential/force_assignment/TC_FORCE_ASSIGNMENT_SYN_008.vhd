-- =============================================================
-- Case ID: TC_FORCE_ASSIGNMENT_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Force in a procedure body with in mode -- tests force assignment inside a subprogram (not just process)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity force_asgn_syn_008 is
end entity force_asgn_syn_008;

architecture test of force_asgn_syn_008 is
  signal s_result : std_logic := '0';

  procedure proc_force_drive(signal sig : out std_logic; val : std_logic) is
  begin
    sig <= force in val;
  end procedure;
begin
  process is
  begin
    proc_force_drive(s_result, '1');
    wait for 10 ns;
    s_result <= release in;
    wait;
  end process;
end architecture test;
