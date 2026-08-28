-- =============================================================
-- Case ID: TC_WAVEFORM_ELEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.2
-- Production: waveform_element ::= value_expression [ after time_expression ] | null [ after time_expression ]
-- Case Type: Positive
-- Test Focus: Waveform element with value expression and after time clause using an integer literal time value
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity wave_elem_syn_002 is
end entity wave_elem_syn_002;

architecture test of wave_elem_syn_002 is
  signal s_out : std_logic := '0';
begin
  process is
  begin
    s_out <= '1' after 5 ns;
    wait;
  end process;
end architecture test;
