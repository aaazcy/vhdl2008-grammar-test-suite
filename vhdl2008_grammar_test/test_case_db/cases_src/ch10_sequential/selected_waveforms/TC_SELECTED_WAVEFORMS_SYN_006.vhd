-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORMS_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveforms ::= { waveform when choices , } waveform when choices
-- Case Type: Positive
-- Test Focus: Selected waveforms with multiple choices per branch using vertical bar separator (｜)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_syn_006 is
end entity sel_wave_syn_006;

architecture test of sel_wave_syn_006 is
  signal s_out : std_logic := '0';
  signal s_mode : integer range 0 to 3 := 0;
begin
  process(s_mode) is
  begin
    with s_mode select
      s_out <= '1' when 0 | 1,
               '0' when 2 | 3;
  end process;
end architecture test;
