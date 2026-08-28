-- =============================================================
-- Case ID: TC_FORCE_ASSIGNMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Rule Description: Force in mode on an input port is semantically invalid -- input ports cannot be forced in
-- Case Type: Negative
-- Test Focus: Attempting to force in on an input port signal -- input ports should not receive force in within the entity
-- Expected Result: Triggers semantic error: cannot force in on input port
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity force_asgn_smn_002 is
  port (
    i_data : in std_logic
  );
end entity force_asgn_smn_002;

architecture test of force_asgn_smn_002 is
begin
  process is
  begin
    i_data <= force in '1';  -- ERROR: force in on input port
    wait;
  end process;
end architecture test;
