-- =============================================================
-- Case ID: TC_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_conditional_signal_assignment ::= target <= [ guarded ] [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Negative
-- Test Focus: concurrent_conditional_signal_assignment: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity concurrent_cond_e2 is end entity;
architecture bh of concurrent_cond_e2 is
  -- ERROR: invalid syntax in concurrent_conditional_signal_assignment
  signal s : bit;
begin
  s <= '1'
end architecture bh;