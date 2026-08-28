-- =============================================================
-- Case ID: TC_CONCURRENT_SIMPLE_SIGNAL_ASSIGNMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SIMPLE_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_simple_signal_assignment ::= target <= [ guarded ] [ delay_mechanism ] waveform ;
-- Case Type: Negative
-- Test Focus: concurrent_simple_signal_assignment: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity concurrent_simp_e2 is end entity;
architecture bh of concurrent_simp_e2 is
  -- ERROR: invalid syntax in concurrent_simple_signal_assignment
  signal s : bit;
begin
  s <= '1'
end architecture bh;