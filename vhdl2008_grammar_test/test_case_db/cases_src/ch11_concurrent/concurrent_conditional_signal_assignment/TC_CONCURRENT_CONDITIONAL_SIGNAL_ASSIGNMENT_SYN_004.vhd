-- =============================================================
-- Case ID: TC_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_conditional_signal_assignment ::= target <= [ guarded ] [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Positive
-- Test Focus: with delay_mechanism — `y <= transport a after 2 ns when sel='0' else b after 1 ns;` uses the transport delay model, verifying that a conditional assignment can specify a delay_mechanism
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ccsa_delay_ent is
  port(a, b, sel : in bit; y : out bit);
end entity ccsa_delay_ent;
architecture bh of ccsa_delay_ent is
begin
  y <= transport a after 2 ns when sel = '0' else b after 1 ns;
end architecture bh;
