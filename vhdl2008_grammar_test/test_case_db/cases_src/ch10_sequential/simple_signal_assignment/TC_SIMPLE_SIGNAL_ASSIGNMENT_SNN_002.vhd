-- =============================================================
-- Case ID: TC_SIMPLE_SIGNAL_ASSIGNMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_signal_assignment ::= simple_waveform_assignment simple_force_assignment | simple_release_assignment
-- Case Type: Negative
-- Test Focus: simple_signal_assignment: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity simple_signal_a_e2 is end entity;
architecture bh of simple_signal_a_e2 is
  -- ERROR: invalid syntax in simple_signal_assignment
  signal s : bit;
begin
  s <= '1'
end architecture bh;