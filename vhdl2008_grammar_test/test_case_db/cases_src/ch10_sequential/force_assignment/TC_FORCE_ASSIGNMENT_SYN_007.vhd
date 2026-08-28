-- =============================================================
-- Case ID: TC_FORCE_ASSIGNMENT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Force on std_logic_vector with chain of when/else conditionals -- tests multiple condition branches in one force statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity force_asgn_syn_007 is
end entity force_asgn_syn_007;

architecture test of force_asgn_syn_007 is
  signal s_vec    : std_logic_vector(3 downto 0) := "0000";
  signal s_high   : std_logic := '0';
  signal s_active : std_logic := '0';
begin
  process is
  begin
    s_vec <= force
      "1111" when s_high = '1' else
      "1010" when s_active = '1' else
      "0101";
    wait for 10 ns;
    s_vec <= release;
    wait;
  end process;
end architecture test;
