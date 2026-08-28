-- =============================================================
-- Case ID: TC_FORCE_MODE_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_mode ::= in | out
-- Rule Description: Force in on input port is semantically invalid -- input ports cannot be forced in from within the entity
-- Case Type: Negative
-- Test Focus: Attempting `force in` on an input port -- semantically invalid because input ports should be driven externally
-- Expected Result: Triggers semantic error: cannot force in on input port
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity fmode_smn_001 is
  port (
    i_sig : in std_logic
  );
end entity fmode_smn_001;

architecture test of fmode_smn_001 is
begin
  process is
  begin
    i_sig <= force in '1';  -- ERROR: force in on input port
    wait;
  end process;
end architecture test;
