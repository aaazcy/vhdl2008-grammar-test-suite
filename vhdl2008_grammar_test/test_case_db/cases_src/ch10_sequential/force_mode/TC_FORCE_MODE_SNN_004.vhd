-- =============================================================
-- Case ID: TC_FORCE_MODE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_MODE
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_mode ::= in | out
-- Case Type: Negative
-- Test Focus: Force with no mode but release with invalid mode `release input` -- tests that release with bad mode is caught even when force had no mode
-- Expected Result: Triggers syntax error: invalid force_mode in release
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity fmode_snn_004 is
end entity fmode_snn_004;

architecture test of fmode_snn_004 is
  signal s_sig : std_logic := '0';
begin
  process is
  begin
    s_sig <= force '1';
    wait for 10 ns;
    s_sig <= release input;  -- ERROR: 'input' invalid in release
    wait;
  end process;
end architecture test;
