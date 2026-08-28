-- =============================================================
-- Case ID: TC_CONDITIONAL_WAVEFORMS_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_waveforms ::= waveform when condition { else waveform when condition } [ else waveform ]
-- Case Type: Negative
-- Test Focus: Missing the waveform value before `when` keyword — only the condition is provided
-- Expected Result: Triggers syntax error: missing waveform before when
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_wave_snn_003 is
end entity cond_wave_snn_003;

architecture test of cond_wave_snn_003 is
  signal s_bad : std_logic := '0';
  signal s_en  : std_logic := '1';
begin
  process(s_en) is
  begin
    s_bad <= when s_en = '1';    -- ERROR: missing waveform before 'when'
  end process;
end architecture test;
