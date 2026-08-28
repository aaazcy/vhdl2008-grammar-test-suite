-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORMS_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveforms ::= { waveform when choices , } waveform when choices
-- Case Type: Positive
-- Test Focus: Selected waveforms with after time clauses on each waveform alternative
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_syn_004 is
end entity sel_wave_syn_004;

architecture test of sel_wave_syn_004 is
  signal s_out : std_logic := '0';
  signal s_sel : integer range 0 to 2 := 0;
begin
  process(s_sel) is
  begin
    with s_sel select
      s_out <= '1' after 5 ns when 0,
               '0' after 3 ns when 1,
               'Z' after 10 ns when 2;
  end process;
end architecture test;
