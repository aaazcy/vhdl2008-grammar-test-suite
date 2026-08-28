-- =============================================================
-- Case ID: TC_WAVEFORM_ELEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.2
-- Production: waveform_element ::= value_expression [ after time_expression ] | null [ after time_expression ]
-- Case Type: Positive
-- Test Focus: Waveform element with after time using picoseconds unit — tests various time unit suffixes
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity wave_elem_syn_003 is
end entity wave_elem_syn_003;

architecture test of wave_elem_syn_003 is
  signal s_fast : std_logic := '0';
begin
  process is
  begin
    s_fast <= '1' after 100 ps;
    wait;
  end process;
end architecture test;
