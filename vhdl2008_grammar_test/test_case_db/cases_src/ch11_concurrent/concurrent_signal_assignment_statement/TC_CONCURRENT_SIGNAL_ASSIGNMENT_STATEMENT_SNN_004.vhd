-- =============================================================
-- Case ID: TC_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_signal_assignment_statement ::= [ label : ] [ postponed ] concurrent_simple_signal_assignment | [ label : ] [ postponed ] concurrent_conditional_signal_assignment | [ label : ] [ postponed ] concurrent_selected_signal_assignment
-- Case Type: Negative
-- Test Focus: SNN: missing waveform after else — in y <= a when sel = '1' else ; there is no waveform to the right of else, and the else branch of conditional_waveforms must carry a waveform
-- Expected Result: Triggers syntax error: primary expression expected
-- Dependencies: None
-- =============================================================
entity csas_missing_else_wave is
  port(a, sel : in bit; y : out bit);
end entity csas_missing_else_wave;
architecture vhdl2008 of csas_missing_else_wave is
begin
  y <= a when sel = '1' else;
end architecture vhdl2008;
