-- =============================================================
-- Case ID: TC_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Test Focus: Concurrent conditional signal assignment: target <= conditional_waveforms; — if-like concurrent signal drive
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_concurrent_conditional_signal_assignment_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_concurrent_conditional_signal_assignment_syn_s01 is
  signal s_ccsa:integer:=0;
begin
  s_ccsa<=10 when true else 0; r<=s_ccsa;end architecture bh;
