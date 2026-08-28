-- =============================================================
-- Case ID: TC_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_conditional_signal_assignment ::= target <= [ guarded ] [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Negative
-- Test Focus: SNN: missing condition expression after when — in y <= a when ; there is no condition to the right of when, and every when branch of conditional_waveforms must carry a condition
-- Expected Result: Triggers syntax error: primary expression expected
-- Dependencies: None
-- =============================================================
entity ccsa_missing_cond is
  port(a, sel : in bit; y : out bit);
end entity ccsa_missing_cond;
architecture vhdl2008 of ccsa_missing_cond is
begin
  y <= a when;
end architecture vhdl2008;
