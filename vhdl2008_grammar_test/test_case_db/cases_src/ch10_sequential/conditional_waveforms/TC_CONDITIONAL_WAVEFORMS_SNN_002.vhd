-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORMS_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveforms ::= waveform when condition { else waveform when condition } [ else waveform ]
-- Case Type: Negative
-- Test Focus: Missing the boolean condition after the `when` keyword in conditional waveform expression
-- Expected Result: Triggers syntax error: missing condition after when
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_wave_snn_002 is
end entity cond_wave_snn_002;

architecture test of cond_wave_snn_002 is
  signal s_bad : std_logic := '0';
begin
  process is
  begin
    s_bad <= '1' when;          -- ERROR: missing condition after 'when'
    wait;
  end process;
end architecture test;
