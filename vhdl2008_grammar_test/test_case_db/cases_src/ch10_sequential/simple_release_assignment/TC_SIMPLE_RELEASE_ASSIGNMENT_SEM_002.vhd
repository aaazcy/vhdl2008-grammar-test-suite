-- =============================================================
-- Case ID: TC_SIMPLE_RELEASE_ASSIGNMENT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_026
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_release_assignment ::= target <= release [ force_mode ] ;
-- Rule Description: Release out mode on output port restores the original port driver
-- Case Type: Positive
-- Test Focus: Release out correctly applied on output port — valid force mode and target compatibility
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity simple_release_sem_002 is
  port (
    p_data : out std_logic_vector(3 downto 0)
  );
end entity simple_release_sem_002;

architecture test of simple_release_sem_002 is
begin
  process is
  begin
    p_data <= force out "1100";
    wait for 50 ns;
    p_data <= release out;
    wait;
  end process;
end architecture test;
