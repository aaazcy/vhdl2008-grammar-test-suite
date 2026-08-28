-- =============================================================
-- Case ID: TC_SIMPLE_FORCE_ASSIGNMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_2008_006
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_force_assignment ::= target <= force [ force_mode ] expression ;
-- Rule Description: Force effective mode must be compatible with the target signal
-- Case Type: Negative
-- Test Focus: Force in mode on an input port (input ports are sources, cannot be forced in)
-- Expected Result: Triggers semantic error: incompatible force mode for input port
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity simple_force_smn_002 is
  port (
    p_in : in std_logic
  );
end entity simple_force_smn_002;

architecture test of simple_force_smn_002 is
begin
  process is
  begin
    p_in <= force in '1';   -- ERROR: cannot force 'in' on an input port
    wait;
  end process;
end architecture test;
