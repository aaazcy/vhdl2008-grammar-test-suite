-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORMS_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SELECTED_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveforms ::= { waveform when choices , } waveform when choices
-- Rule Description: Selected waveforms must cover all possible choices of the select expression
-- Case Type: Positive
-- Test Focus: Valid selected waveforms in a signal assignment covering all std_logic values with others choice
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_sem_001 is
end entity sel_wave_sem_001;

architecture test of sel_wave_sem_001 is
  signal s_out : std_logic_vector(3 downto 0) := "0000";
  signal s_mode : std_logic_vector(1 downto 0) := "00";
begin
  process(s_mode) is
  begin
    with s_mode select
      s_out <= "1010" when "00",
               "0101" when "01",
               "1111" when others;
  end process;
end architecture test;
