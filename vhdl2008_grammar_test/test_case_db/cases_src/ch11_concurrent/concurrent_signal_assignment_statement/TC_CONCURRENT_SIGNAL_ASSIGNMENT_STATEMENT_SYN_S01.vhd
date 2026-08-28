-- =============================================================
-- Case ID: TC_CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: CONCURRENT_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Test Focus: Concurrent signal assignment: [label:] concurrent_simple ｜ concurrent_conditional ｜ concurrent_selected signal assignment
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_concurrent_signal_assignment_statement_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_concurrent_signal_assignment_statement_syn_s01 is
  signal s_csas:integer:=0;
begin
  s_csas<=42; r<=s_csas;end architecture bh;
