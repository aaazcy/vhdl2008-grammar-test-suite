-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORM_ASSIGNMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveform_assignment ::= with expression select [ ? ] target <= [ delay_mechanism ] selected_waveforms ;
-- Case Type: Positive
-- Test Focus: Selected waveform with `?` matching select and no delay_mechanism -- tests `with expr select ? target <= waveform` form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_syn_002 is
end entity sel_wave_syn_002;

architecture test of sel_wave_syn_002 is
  signal s_sel    : std_logic_vector(1 downto 0) := "00";
  signal s_target : std_logic := '0';
begin
  process is
  begin
    with s_sel select ? s_target <=
      '1' when "11",
      '0' when others;
    wait for 10 ns;
    wait;
  end process;
end architecture test;
