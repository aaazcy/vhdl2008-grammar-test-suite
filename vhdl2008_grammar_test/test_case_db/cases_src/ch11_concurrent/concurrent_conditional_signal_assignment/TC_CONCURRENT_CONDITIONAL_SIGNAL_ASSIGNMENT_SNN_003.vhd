-- =============================================================
-- Case ID: TC_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_conditional_signal_assignment ::= target <= [ guarded ] [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Negative
-- Test Focus: concurrent_conditional_signal_assignment: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity concurrent_cond_e3 is end entity;
architecture bh of concurrent_cond_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;