-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORMS_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveforms ::= { waveform when choices , } waveform when choices
-- Case Type: Negative
-- Test Focus: Missing choices expression after the `when` keyword in a waveform alternative
-- Expected Result: Triggers syntax error: missing choices after when
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_snn_003 is
end entity sel_wave_snn_003;

architecture test of sel_wave_snn_003 is
  signal s_bad : std_logic := '0';
  signal s_sel : std_logic := '0';
begin
  process(s_sel) is
  begin
    with s_sel select
      s_bad <= '1' when,       -- ERROR: missing choices after 'when'
               '0' when '0';
  end process;
end architecture test;
