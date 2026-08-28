-- =============================================================
-- Case ID: TC_WAVEFORM_ELEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.2
-- Production: waveform_element ::= value_expression [ after time_expression ] | null [ after time_expression ]
-- Case Type: Negative
-- Test Focus: `after` keyword present but missing the time expression that should follow it
-- Expected Result: Triggers syntax error: missing time expression after after
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity wave_elem_snn_002 is
end entity wave_elem_snn_002;

architecture test of wave_elem_snn_002 is
  signal s_bad : std_logic := '0';
begin
  process is
  begin
    s_bad <= '1' after;     -- ERROR: missing time expression after 'after'
    wait;
  end process;
end architecture test;
