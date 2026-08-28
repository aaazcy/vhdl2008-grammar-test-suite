-- =============================================================
-- Case ID: TC_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_conditional_signal_assignment ::= target <= [ guarded ] [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Negative
-- Test Focus: SNN: missing "when" keyword — in `y <= a sel='1' else b;` the condition has no when keyword before it, verifying that every conditional branch must be introduced by when
-- Expected Result: Triggers syntax error: missing "when" in conditional waveform
-- Dependencies: None
-- =============================================================
entity ccsa_snn4_ent is
  port(a, b, sel : in bit; y : out bit);
end entity ccsa_snn4_ent;
architecture bh of ccsa_snn4_ent is
begin
  y <= a sel = '1' else b;
end architecture bh;
