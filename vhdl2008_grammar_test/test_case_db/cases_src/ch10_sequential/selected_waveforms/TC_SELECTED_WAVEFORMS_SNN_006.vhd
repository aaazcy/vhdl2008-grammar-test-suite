-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORMS_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveforms ::= { waveform when choices , } waveform when choices
-- Case Type: Negative
-- Test Focus: Trailing comma after the last waveform alternative (not allowed in selected waveforms)
-- Expected Result: Triggers syntax error: trailing comma not allowed
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_snn_006 is
end entity sel_wave_snn_006;

architecture test of sel_wave_snn_006 is
  signal s_bad : std_logic := '0';
  signal s_sel : std_logic := '0';
begin
  process(s_sel) is
  begin
    with s_sel select
      s_bad <= '1' when '1',       -- note comma after first
               '0' when '0',       -- ERROR: trailing comma after last alternative
    ;
  end process;
end architecture test;
