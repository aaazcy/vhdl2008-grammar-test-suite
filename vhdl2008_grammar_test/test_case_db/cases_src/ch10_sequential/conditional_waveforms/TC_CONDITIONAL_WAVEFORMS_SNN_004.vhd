-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORMS_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveforms ::= waveform when condition { else waveform when condition } [ else waveform ]
-- Case Type: Negative
-- Test Focus: Using a semicolon to terminate before completing the conditional waveform expression
-- Expected Result: Triggers syntax error: premature semicolon
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_wave_snn_004 is
end entity cond_wave_snn_004;

architecture test of cond_wave_snn_004 is
  signal s_bad : std_logic := '0';
  signal s_en  : std_logic := '1';
begin
  process(s_en) is
  begin
    s_bad <= '1' when s_en = '1';  -- valid, but then:
    else '0' when s_en = '0';       -- ERROR: 'else' without prior context
  end process;
end architecture test;
