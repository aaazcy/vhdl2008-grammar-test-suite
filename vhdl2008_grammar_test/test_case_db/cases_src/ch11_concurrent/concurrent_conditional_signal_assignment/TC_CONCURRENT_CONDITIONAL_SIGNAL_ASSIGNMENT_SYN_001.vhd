-- =============================================================
-- Case ID: TC_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_conditional_signal_assignment ::= target <= [ guarded ] [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Positive
-- Test Focus: minimal form: a single when condition — `y <= a when sel='1' else b;` is a two-way multiplexer, verifying the minimal complete form of a conditional signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ccsa_min_ent is
  port(a, b, sel : in bit; y : out bit);
end entity ccsa_min_ent;
architecture bh of ccsa_min_ent is
begin
  y <= a when sel = '1' else b;
end architecture bh;
