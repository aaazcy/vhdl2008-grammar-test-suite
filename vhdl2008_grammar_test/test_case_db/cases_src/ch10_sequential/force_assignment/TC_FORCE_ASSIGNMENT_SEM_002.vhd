-- =============================================================
-- Case ID: TC_FORCE_ASSIGNMENT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Rule Description: Force with conditional expression is semantically valid in a process on std_logic_vector
-- Case Type: Positive
-- Test Focus: Valid force with conditional when/else in process driving std_logic_vector -- tests force conditional semantic correctness
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity force_asgn_sem_002 is
end entity force_asgn_sem_002;

architecture test of force_asgn_sem_002 is
  signal s_vec  : std_logic_vector(7 downto 0) := "00000000";
  signal s_flag : std_logic := '0';
begin
  process is
  begin
    s_vec <= force "11111111" when s_flag = '1' else "00001111";
    wait for 10 ns;
    s_vec <= release;
    wait;
  end process;
end architecture test;
