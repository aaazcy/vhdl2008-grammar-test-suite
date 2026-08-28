-- =============================================================
-- Case ID: TC_WAVEFORM_ELEMENT_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.2
-- Production: waveform_element ::= value_expression [ after time_expression ] | null [ after time_expression ]
-- Case Type: Positive
-- Test Focus: Multiple waveform elements in a comma-separated waveform list with different after values
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity wave_elem_syn_008 is
end entity wave_elem_syn_008;

architecture test of wave_elem_syn_008 is
  signal s_pulse : std_logic := '0';
begin
  process is
  begin
    s_pulse <= '1' after 2 ns, '0' after 8 ns;  -- two waveform elements
    wait;
  end process;
end architecture test;
