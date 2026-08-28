-- =============================================================
-- Case ID: TC_WAVEFORM_ELEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.2
-- Production: waveform_element ::= value_expression [ after time_expression ] | null [ after time_expression ]
-- Case Type: Negative
-- Test Focus: Using `delay` keyword instead of `after` for waveform timing — not valid in waveform_element
-- Expected Result: Triggers syntax error: delay not valid, use after
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity wave_elem_snn_004 is
end entity wave_elem_snn_004;

architecture test of wave_elem_snn_004 is
  signal s_bad : std_logic := '0';
begin
  process is
  begin
    s_bad <= '1' delay 5 ns;    -- ERROR: 'delay' not valid in waveform element
    wait;
  end process;
end architecture test;
