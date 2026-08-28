-- =============================================================
-- Case ID: TC_SIMPLE_FORCE_ASSIGNMENT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_force_assignment ::= target <= force [ force_mode ] expression ;
-- Rule Description: Force assignment is valid within a process context in VHDL 2008
-- Case Type: Positive
-- Test Focus: Force in mode within a clocked process drives a std_logic_vector signal with a hex literal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity simple_force_sem_001 is
end entity simple_force_sem_001;

architecture test of simple_force_sem_001 is
  signal s_bus : std_logic_vector(7 downto 0) := X"00";
begin
  process is
  begin
    s_bus <= force in X"AB";
    wait for 10 ns;
    s_bus <= release in;
    wait;
  end process;
end architecture test;
