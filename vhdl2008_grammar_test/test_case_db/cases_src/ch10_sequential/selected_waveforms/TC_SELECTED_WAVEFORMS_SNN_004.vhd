-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORMS_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveforms ::= { waveform when choices , } waveform when choices
-- Case Type: Negative
-- Test Focus: Missing the waveform value before the `when` keyword in a selected waveform alternative
-- Expected Result: Triggers syntax error: missing waveform before when
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_snn_004 is
end entity sel_wave_snn_004;

architecture test of sel_wave_snn_004 is
  signal s_bad : std_logic := '0';
  signal s_sel : std_logic := '0';
begin
  process(s_sel) is
  begin
    with s_sel select
      s_bad <= when '1',       -- ERROR: missing waveform before 'when'
               '0' when '0';
  end process;
end architecture test;
