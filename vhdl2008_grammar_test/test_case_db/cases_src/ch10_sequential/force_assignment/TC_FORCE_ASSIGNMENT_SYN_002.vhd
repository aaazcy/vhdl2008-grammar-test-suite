-- =============================================================
-- Case ID: TC_FORCE_ASSIGNMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Force with in mode and simple expression -- tests `force in expr` as the basic force_mode form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity force_asgn_syn_002 is
end entity force_asgn_syn_002;

architecture test of force_asgn_syn_002 is
  signal s_sig : std_logic := '0';
begin
  process is
  begin
    s_sig <= force in '1';
    wait for 10 ns;
    s_sig <= release in;
    wait;
  end process;
end architecture test;
