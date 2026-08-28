-- =============================================================
-- Case ID: TC_SIMPLE_SIGNAL_ASSIGNMENT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SIMPLE_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Test Focus: Simple signal assignment: target <= [delay_mechanism] waveform; — basic waveform assignment
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_simple_signal_assignment_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_simple_signal_assignment_syn_s01 is
  signal s_ssa:integer:=0;
begin
  s_ssa<=42;  -- simple assignment
  s_ssa<=1 after 10 ns;  -- with delay
  r<=s_ssa;end architecture bh;
