-- =============================================================
-- Case ID: TC_CONDITIONAL_FORCE_ASSIGNMENT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Rule Description: Conditional force assignment is valid within a process context
-- Case Type: Positive
-- Test Focus: Conditional force in process selecting between two std_logic_vector values based on mode signal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_force_sem_001 is
end entity cond_force_sem_001;

architecture test of cond_force_sem_001 is
  signal s_data : std_logic_vector(3 downto 0) := "0000";
  signal s_mode : std_logic := '0';
begin
  process is
  begin
    s_data <= force in "1111" when s_mode = '1' else "0000";
    wait for 10 ns;
    s_data <= release in;
    wait;
  end process;
end architecture test;
