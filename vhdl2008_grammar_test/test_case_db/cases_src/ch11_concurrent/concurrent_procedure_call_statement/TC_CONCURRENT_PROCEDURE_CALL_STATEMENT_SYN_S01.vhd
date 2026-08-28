-- =============================================================
-- Case ID: TC_CONCURRENT_PROCEDURE_CALL_STATEMENT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: CONCURRENT_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.4
-- Test Focus: Concurrent procedure call: [label:] procedure_call; — procedure called as concurrent statement (equivalent to process)
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_concurrent_procedure_call_statement_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_concurrent_procedure_call_statement_syn_s01 is
  procedure p_ccs(signal v:out integer; n:integer) is begin v<=n; end procedure;
  signal s_ccs:integer:=0;
begin
  p_ccs(s_ccs, 42); r<=s_ccs;end architecture bh;
