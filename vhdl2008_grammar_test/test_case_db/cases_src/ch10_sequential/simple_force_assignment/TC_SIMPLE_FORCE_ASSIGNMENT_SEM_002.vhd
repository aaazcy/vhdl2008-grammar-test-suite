-- =============================================================
-- Case ID: TC_SIMPLE_FORCE_ASSIGNMENT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_2008_006
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_force_assignment ::= target <= force [ force_mode ] expression ;
-- Rule Description: Force mode must be compatible with the target signal's effective mode
-- Case Type: Positive
-- Test Focus: Force out mode used correctly on an output port to override its driver from within process
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity simple_force_sem_002 is
  port (
    p_data : out std_logic_vector(3 downto 0)
  );
end entity simple_force_sem_002;

architecture test of simple_force_sem_002 is
begin
  process is
  begin
    p_data <= force out "1100";
    wait for 50 ns;
    p_data <= release out;
    wait;
  end process;
end architecture test;
