-- =============================================================
-- Case ID: TC_CONCURRENT_ASSERTION_STATEMENT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: CONCURRENT_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Test Focus: Concurrent assertion: [label:] assert condition [report expr] [severity expr]; — assertion as concurrent statement
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_concurrent_assertion_statement_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_concurrent_assertion_statement_syn_s01 is
  signal s_ca:integer:=0;
begin
  assert s_ca>=0 report "concurrent assertion: negative" severity warning;
  r<=s_ca;end architecture bh;
