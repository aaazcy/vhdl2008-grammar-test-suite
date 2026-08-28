-- =============================================================
-- Case ID: TC_CONCURRENT_SIMPLE_SIGNAL_ASSIGNMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SIMPLE_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_simple_signal_assignment ::= target <= [ guarded ] [ delay_mechanism ] waveform ;
-- Case Type: Negative
-- Test Focus: SNN: missing semicolon——`y <= a` has no terminating semicolon, verifying that a concurrent simple signal assignment must be terminated by a semicolon
-- Expected Result: Triggers syntax error: missing ";" after signal assignment
-- Dependencies: None
-- =============================================================
entity css_snn1_ent is
  port(a : in bit; y : out bit);
end entity css_snn1_ent;
architecture bh of css_snn1_ent is
begin
  y <= a
end architecture bh;
