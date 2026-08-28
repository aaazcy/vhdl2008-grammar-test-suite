-- =============================================================
-- Case ID: TC_WAVEFORM_ELEMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_WAVEFORM_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.2
-- Production: waveform_element ::= value_expression [ after time_expression ] | null [ after time_expression ]
-- Case Type: Positive
-- Test Focus: Waveform element with arithmetic expression as the value and computed after time
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity wave_elem_syn_006 is
end entity wave_elem_syn_006;

architecture test of wave_elem_syn_006 is
  signal s_val : integer := 0;
  constant C_DELAY : time := 5 ns;
begin
  process is
  begin
    s_val <= 2 * 3 + 1 after C_DELAY;
    wait;
  end process;
end architecture test;
