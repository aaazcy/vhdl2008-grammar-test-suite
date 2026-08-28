-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORM_ASSIGNMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveform_assignment ::= with expression select [ ? ] target <= [ delay_mechanism ] selected_waveforms ;
-- Case Type: Positive
-- Test Focus: Selected waveform with `?` matching select AND transport delay -- tests both optional elements combined in one statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_syn_005 is
end entity sel_wave_syn_005;

architecture test of sel_wave_syn_005 is
  signal s_sel    : std_logic := '0';
  signal s_target : bit := '0';
begin
  process is
  begin
    with s_sel select ? s_target <= transport
      '1' when '1',
      '0' when others;
    wait for 10 ns;
    wait;
  end process;
end architecture test;
