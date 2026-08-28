-- =============================================================
-- Case ID: TC_WAVEFORM_ELEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.2
-- Production: waveform_element ::= value_expression [ after time_expression ] | null [ after time_expression ]
-- Case Type: Negative
-- Test Focus: Invalid time unit abbreviation in after clause — using `nsec` instead of `ns`
-- Expected Result: Triggers syntax error: invalid time unit
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity wave_elem_snn_003 is
end entity wave_elem_snn_003;

architecture test of wave_elem_snn_003 is
  signal s_bad : std_logic := '0';
begin
  process is
  begin
    s_bad <= '1' after 5 nsec;  -- ERROR: 'nsec' not a valid time unit
    wait;
  end process;
end architecture test;
