-- =============================================================
-- Case ID: TC_SIMPLE_RELEASE_ASSIGNMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_RELEASE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_release_assignment ::= target <= release [ force_mode ] ;
-- Case Type: Positive
-- Test Focus: Release after force out on std_logic_vector signal — release with matching out mode
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity simple_release_syn_005 is
end entity simple_release_syn_005;

architecture test of simple_release_syn_005 is
  signal s_bus : std_logic_vector(7 downto 0) := X"00";
begin
  process is
  begin
    s_bus <= force out X"FF";
    wait for 25 ns;
    s_bus <= release out;
    wait;
  end process;
end architecture test;
