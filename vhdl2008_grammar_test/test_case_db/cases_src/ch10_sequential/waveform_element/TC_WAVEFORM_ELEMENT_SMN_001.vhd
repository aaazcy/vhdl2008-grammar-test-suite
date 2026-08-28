-- =============================================================
-- Case ID: TC_WAVEFORM_ELEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_WAVEFORM_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.2
-- Production: waveform_element ::= value_expression [ after time_expression ] | null [ after time_expression ]
-- Rule Description: Time expression in after clause must be of type time
-- Case Type: Negative
-- Test Focus: SMN: Wrong type for the after time expression of waveform_element — in '1' after 5 the time expression is an integer literal, it must be of type time
-- Expected Result: Triggers analysis error: can't match integer literal with type physical type "time"
-- Dependencies: None
-- =============================================================
entity wave_elem_time_type is
end entity wave_elem_time_type;

architecture vhdl2008 of wave_elem_time_type is
  signal s_bad : bit := '0';
begin
  process is
  begin
    s_bad <= '1' after 5;
    wait;
  end process;
end architecture vhdl2008;
