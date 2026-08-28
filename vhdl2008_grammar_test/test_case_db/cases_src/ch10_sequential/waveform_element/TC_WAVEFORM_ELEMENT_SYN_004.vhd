-- =============================================================
-- Case ID: TC_WAVEFORM_ELEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.2
-- Production: waveform_element ::= value_expression [ after time_expression ] | null [ after time_expression ]
-- Case Type: Positive
-- Test Focus: Waveform element using `null` keyword without after clause — represents a null transaction
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity wave_elem_syn_004 is
end entity wave_elem_syn_004;

architecture test of wave_elem_syn_004 is
  signal s_guard : std_logic bus;
begin
  b_guard : block (true)
  begin
    s_guard <= guarded null;      -- null transaction (disconnection)
  end block;
end architecture test;
