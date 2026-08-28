-- =============================================================
-- Case ID: TC_WAVEFORM_ELEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.2
-- Production: waveform_element ::= value_expression [ after time_expression ] | null [ after time_expression ]
-- Case Type: Positive
-- Test Focus: Minimal waveform element — value expression without after clause in a signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity wave_elem_syn_001 is
end entity wave_elem_syn_001;

architecture test of wave_elem_syn_001 is
  signal s_out : std_logic := '0';
begin
  process is
  begin
    s_out <= '1';       -- value_expression without after
    wait;
  end process;
end architecture test;
