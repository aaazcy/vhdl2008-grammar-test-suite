-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORMS_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveforms ::= { waveform when choices , } waveform when choices
-- Case Type: Positive
-- Test Focus: Minimal selected waveforms — single waveform with single choice clause, no trailing comma
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_syn_001 is
end entity sel_wave_syn_001;

architecture test of sel_wave_syn_001 is
  signal s_out : std_logic := '0';
  signal s_sel : bit := '0';
begin
  process(s_sel) is
  begin
    with s_sel select
      s_out <= '1' when '1',
               '0' when '0';
  end process;
end architecture test;
