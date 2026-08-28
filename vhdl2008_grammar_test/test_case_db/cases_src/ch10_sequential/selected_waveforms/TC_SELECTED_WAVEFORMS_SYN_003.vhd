-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORMS_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveforms ::= { waveform when choices , } waveform when choices
-- Case Type: Positive
-- Test Focus: Selected waveforms with four waveform alternatives covering all states of a 2-bit select
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_syn_003 is
end entity sel_wave_syn_003;

architecture test of sel_wave_syn_003 is
  signal s_out : std_logic_vector(1 downto 0) := "00";
  signal s_sel : bit_vector(1 downto 0) := "00";
begin
  process(s_sel) is
  begin
    with s_sel select
      s_out <= "01" when "00",
               "10" when "01",
               "11" when "10",
               "00" when "11";
  end process;
end architecture test;
