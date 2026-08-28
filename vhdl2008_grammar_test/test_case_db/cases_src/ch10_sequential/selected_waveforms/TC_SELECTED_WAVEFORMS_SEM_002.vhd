-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORMS_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SELECTED_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveforms ::= { waveform when choices , } waveform when choices
-- Rule Description: `unaffected` is valid in selected waveforms when used inside a process
-- Case Type: Positive
-- Test Focus: Selected waveforms with `unaffected` preserving previous signal state for specific choices
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_sem_002 is
end entity sel_wave_sem_002;

architecture test of sel_wave_sem_002 is
  type t_cmd is (NOP, SET, CLR);
  signal s_reg : std_logic_vector(7 downto 0) := X"00";
  signal s_cmd : t_cmd := NOP;
begin
  process(s_cmd) is
  begin
    with s_cmd select
      s_reg <= X"FF" when SET,
               X"00" when CLR,
               unaffected when NOP;
  end process;
end architecture test;
