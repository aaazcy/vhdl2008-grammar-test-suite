-- =============================================================
-- Case ID: TC_SELECTED_WAVEFORM_ASSIGNMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_waveform_assignment ::= with expression select [ ? ] target <= [ delay_mechanism ] selected_waveforms ;
-- Rule Description: Waveforms in a selected waveform assignment must match the target type
-- Case Type: Negative
-- Test Focus: SMN: waveform type of the selected waveform mismatches the target — in with s_sel select s_target <= 'x' when others the waveform is a character literal, mismatching the integer-typed target s_target
-- Expected Result: Triggers analysis error: can't match character literal 'x' with type integer
-- Dependencies: None
-- =============================================================
entity sel_wave_type_mismatch is
end entity sel_wave_type_mismatch;

architecture vhdl2008 of sel_wave_type_mismatch is
  signal s_sel    : integer := 0;
  signal s_target : integer := 0;
begin
  with s_sel select s_target <= 'x' when others;
end architecture vhdl2008;
