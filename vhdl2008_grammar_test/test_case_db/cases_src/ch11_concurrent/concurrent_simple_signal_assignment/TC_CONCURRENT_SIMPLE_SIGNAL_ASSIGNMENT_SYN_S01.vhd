-- =============================================================
-- Case ID: TC_CONCURRENT_SIMPLE_SIGNAL_ASSIGNMENT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: CONCURRENT_SIMPLE_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Test Focus: Concurrent simple signal assignment: target <= [delay_mechanism] waveform; — basic concurrent signal drive
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_concurrent_simple_signal_assignment_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_concurrent_simple_signal_assignment_syn_s01 is
  signal s_css:integer:=0;
begin
  s_css<=42 after 1 ns; r<=s_css;end architecture bh;
