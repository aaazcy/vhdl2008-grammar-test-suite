-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORMS_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveforms ::= { waveform when choices , } waveform when choices
-- Case Type: Positive
-- Test Focus: Selected waveforms with range choices (0 to 3) and specific value choices combined
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_syn_007 is
end entity sel_wave_syn_007;

architecture test of sel_wave_syn_007 is
  signal s_out : std_logic_vector(7 downto 0) := X"00";
  signal s_level : integer range 0 to 7 := 0;
begin
  process(s_level) is
  begin
    with s_level select
      s_out <= X"FF" when 0 to 3,
               X"0F" when 4 to 6,
               X"00" when 7;
  end process;
end architecture test;
