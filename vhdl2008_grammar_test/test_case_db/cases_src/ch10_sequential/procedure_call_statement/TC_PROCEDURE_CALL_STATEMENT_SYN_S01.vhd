-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_STATEMENT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.7
-- Test Focus: Procedure call statement: [label:] procedure_call; — labelled/standalone procedure call
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_procedure_call_statement_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_procedure_call_statement_syn_s01 is
  procedure p_set(signal v:out integer; n:integer) is begin v<=n; end procedure;
  signal s_pcs:integer:=0;
begin
  p_set(s_pcs, 42); r<=s_pcs;end architecture bh;
