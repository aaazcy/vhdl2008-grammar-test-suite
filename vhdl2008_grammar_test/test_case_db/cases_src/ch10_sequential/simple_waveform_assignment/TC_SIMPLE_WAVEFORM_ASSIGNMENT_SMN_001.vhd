-- =============================================================
-- Case ID: TC_SIMPLE_WAVEFORM_ASSIGNMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_SIMP_WF_TYPE
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_waveform_assignment ::= target <= [ delay_mechanism ] waveform ;
-- Rule Description: Waveform value must match the target signal type
-- Case Type: Negative
-- Error Category: type_mismatch
-- Test Focus: SMN: transport waveform type mismatches the target — in transport 'x' after 1 ns the waveform is a character literal, mismatching the integer type target s_targ
-- Expected Result: Triggers analysis error: can't match character literal 'x' with type integer
-- Dependencies: None
-- =============================================================
entity swa_char_waveform is port(y:out integer); end entity;
architecture vhdl2008 of swa_char_waveform is
  signal s_targ : integer := 0;
begin
  s_targ <= transport 'x' after 1 ns;
  y <= s_targ;
end architecture vhdl2008;
