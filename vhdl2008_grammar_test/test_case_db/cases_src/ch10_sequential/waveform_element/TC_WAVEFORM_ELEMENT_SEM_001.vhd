-- =============================================================
-- Case ID: TC_WAVEFORM_ELEMENT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_WAVEFORM_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.2
-- Production: waveform_element ::= value_expression [ after time_expression ] | null [ after time_expression ]
-- Rule Description: Null waveform element represents a null transaction used for disconnection
-- Case Type: Positive
-- Test Focus: Null waveform element correctly used as a guarded signal disconnection within a block
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity wave_elem_sem_001 is
end entity wave_elem_sem_001;

architecture test of wave_elem_sem_001 is
  signal s_guard : std_logic bus;
begin
  b_guard : block (true)
  begin
    s_guard <= guarded '1' after 2 ns, null after 10 ns;  -- drive then disconnect
    s_guard <= guarded '0' after 20 ns;
  end block;
end architecture test;
