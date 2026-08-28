-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORM_ASSIGNMENT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveform_assignment ::= with expression select [ ? ] target <= [ delay_mechanism ] selected_waveforms ;
-- Case Type: Positive
-- Test Focus: Selected waveform with std_logic select and after clauses in waveforms -- tests selected_waveforms containing `expr after time` delay elements
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_syn_007 is
end entity sel_wave_syn_007;

architecture test of sel_wave_syn_007 is
  signal s_sel    : std_logic := '0';
  signal s_target : std_logic := '0';
begin
  process is
  begin
    with s_sel select s_target <=
      '1' after 5 ns when '1',
      '0' after 3 ns when '0',
      'X' after 1 ns when others;
    wait for 20 ns;
    wait;
  end process;
end architecture test;
