-- =============================================================
-- Case ID: TC_SIMPLE_RELEASE_ASSIGNMENT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_026
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_release_assignment ::= target <= release [ force_mode ] ;
-- Rule Description: Release assignment is valid in sequential context to release a previously forced signal
-- Case Type: Positive
-- Test Focus: Release in mode within a clocked process after force — semantically correct force/release pair
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity simple_release_sem_001 is
end entity simple_release_sem_001;

architecture test of simple_release_sem_001 is
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
