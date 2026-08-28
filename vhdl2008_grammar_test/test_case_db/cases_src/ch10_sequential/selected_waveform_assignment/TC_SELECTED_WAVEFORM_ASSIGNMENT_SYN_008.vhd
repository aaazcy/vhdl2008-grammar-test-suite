-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORM_ASSIGNMENT_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveform_assignment ::= with expression select [ ? ] target <= [ delay_mechanism ] selected_waveforms ;
-- Case Type: Positive
-- Test Focus: Complex selected waveform with transport and multiple waveforms using after clauses -- test full BNF coverage with delay_mechanism and waveform after clauses
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_wave_syn_008 is
end entity sel_wave_syn_008;

architecture test of sel_wave_syn_008 is
  signal s_sel    : std_logic_vector(1 downto 0) := "00";
  signal s_target : std_logic_vector(3 downto 0) := "0000";
begin
  process is
  begin
    with s_sel select s_target <= transport
      "1111" after 2 ns when "11",
      "1010" after 2 ns when "10",
      "0101" after 2 ns when "01",
      "0000" after 1 ns when others;
    wait for 20 ns;
    wait;
  end process;
end architecture test;
