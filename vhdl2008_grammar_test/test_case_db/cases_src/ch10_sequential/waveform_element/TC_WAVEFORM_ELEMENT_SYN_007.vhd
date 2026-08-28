-- =============================================================
-- Case ID: TC_WAVEFORM_ELEMENT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.2
-- Production: waveform_element ::= value_expression [ after time_expression ] | null [ after time_expression ]
-- Case Type: Positive
-- Test Focus: Waveform element with aggregate value expression and after time clause
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity wave_elem_syn_007 is
end entity wave_elem_syn_007;

architecture test of wave_elem_syn_007 is
  signal s_bus : std_logic_vector(3 downto 0) := "0000";
begin
  process is
  begin
    s_bus <= ('1', '0', '1', '0') after 3 ns;
    wait;
  end process;
end architecture test;
