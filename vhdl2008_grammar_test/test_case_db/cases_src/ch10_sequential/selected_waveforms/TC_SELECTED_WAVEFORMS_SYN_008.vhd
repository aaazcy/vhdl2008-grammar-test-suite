-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORMS_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORMS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveforms ::= { waveform when choices , } waveform when choices
-- Case Type: Positive
-- Test Focus: Comprehensive selected waveforms with `others` choice to cover all unlisted cases
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_syn_008 is
end entity sel_wave_syn_008;

architecture test of sel_wave_syn_008 is
  signal s_out : std_logic_vector(3 downto 0) := "0000";
  signal s_op  : std_logic_vector(1 downto 0) := "00";
begin
  process(s_op) is
  begin
    with s_op select
      s_out <= "1111" when "00",
               "0001" when "01",
               "0010" when others;
  end process;
end architecture test;
