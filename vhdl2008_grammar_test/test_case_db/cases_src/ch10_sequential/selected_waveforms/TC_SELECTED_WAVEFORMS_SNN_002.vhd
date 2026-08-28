-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORMS_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveforms ::= { waveform when choices , } waveform when choices
-- Case Type: Negative
-- Test Focus: Missing the mandatory `when` keyword between waveform value and choices
-- Expected Result: Triggers syntax error: missing when keyword
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_snn_002 is
end entity sel_wave_snn_002;

architecture test of sel_wave_snn_002 is
  signal s_bad : std_logic_vector(3 downto 0) := "0000";
  signal s_sel : std_logic := '0';
begin
  process(s_sel) is
  begin
    with s_sel select
      s_bad <= "1111" '1',     -- ERROR: missing 'when' keyword
               "0000" '0';
  end process;
end architecture test;
