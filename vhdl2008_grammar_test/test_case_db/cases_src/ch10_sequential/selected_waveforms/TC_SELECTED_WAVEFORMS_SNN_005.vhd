-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORMS_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveforms ::= { waveform when choices , } waveform when choices
-- Case Type: Negative
-- Test Focus: Using `else` keyword instead of `when` in selected waveforms context (confusing with conditional form)
-- Expected Result: Triggers syntax error: else not valid in selected waveforms
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_snn_005 is
end entity sel_wave_snn_005;

architecture test of sel_wave_snn_005 is
  signal s_bad : std_logic := '0';
  signal s_sel : std_logic := '0';
begin
  process(s_sel) is
  begin
    with s_sel select
      s_bad <= '1' when '1',
               '0' else '0';    -- ERROR: 'else' in selected waveforms
  end process;
end architecture test;
