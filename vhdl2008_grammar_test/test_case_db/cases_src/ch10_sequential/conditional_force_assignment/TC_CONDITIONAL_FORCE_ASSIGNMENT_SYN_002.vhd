-- =============================================================
-- Case ID: TC_CONDITIONAL_FORCE_ASSIGNMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Conditional force with in mode and two condition branches -- tests force in with multiple when/else
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_force_syn_002 is
end entity cond_force_syn_002;

architecture test of cond_force_syn_002 is
  signal s_target : std_logic := '0';
  signal s_flag   : boolean := false;
begin
  process is
  begin
    s_target <= force in '1' when s_flag else '0' when not s_flag else 'Z';
    wait for 5 ns;
    s_target <= release in;
    wait;
  end process;
end architecture test;
