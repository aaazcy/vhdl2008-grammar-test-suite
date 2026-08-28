-- =============================================================
-- Case ID: TC_WAVEFORM_ELEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.2
-- Production: waveform_element ::= value_expression [ after time_expression ] | null [ after time_expression ]
-- Case Type: Positive
-- Test Focus: Waveform element using `null` with after time clause — timed null transaction
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity wave_elem_syn_005 is
end entity wave_elem_syn_005;

architecture test of wave_elem_syn_005 is
  signal s_guard : std_logic bus;
begin
  b_guard : block (true)
  begin
    s_guard <= guarded null after 10 ns;   -- null transaction with delay
  end block;
end architecture test;
