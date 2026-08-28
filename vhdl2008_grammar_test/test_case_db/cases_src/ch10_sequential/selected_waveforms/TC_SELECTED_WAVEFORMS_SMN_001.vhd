-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORMS_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_SELECTED_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveforms ::= { waveform when choices , } waveform when choices
-- Rule Description: Selected waveform choices must not have overlapping/duplicate values
-- Case Type: Negative
-- Test Focus: Duplicate choice values covering the same select expression value in two different branches
-- Expected Result: Triggers semantic error: duplicate choice in selected waveforms
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_smn_001 is
end entity sel_wave_smn_001;

architecture test of sel_wave_smn_001 is
  signal s_bad : std_logic_vector(3 downto 0) := "0000";
  signal s_sel : std_logic_vector(1 downto 0) := "00";
begin
  process(s_sel) is
  begin
    with s_sel select
      s_bad <= "1111" when "00",
               "0000" when "00",   -- ERROR: duplicate choice "00"
               "1010" when others;
  end process;
end architecture test;
