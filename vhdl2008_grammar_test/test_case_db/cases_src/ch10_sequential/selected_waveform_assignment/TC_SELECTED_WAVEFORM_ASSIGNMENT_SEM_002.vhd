-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORM_ASSIGNMENT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveform_assignment ::= with expression select [ ? ] target <= [ delay_mechanism ] selected_waveforms ;
-- Rule Description: Selected waveform with matching select ? is semantically valid in a process
-- Case Type: Positive
-- Test Focus: Valid selected waveform with matching select ? and inertial delay in a process driving std_logic_vector
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_sem_002 is
end entity sel_wave_sem_002;

architecture test of sel_wave_sem_002 is
  signal s_sel    : std_logic_vector(1 downto 0) := "00";
  signal s_target : std_logic_vector(3 downto 0) := "0000";
begin
  process is
  begin
    with s_sel select ? s_target <=
      "1111" when "11",
      "0001" when "01",
      "0000" when others;
    wait for 10 ns;
    wait;
  end process;
end architecture test;
