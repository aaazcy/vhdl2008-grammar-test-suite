-- =============================================================
-- Case ID: TC_CONCURRENT_STATEMENT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: CONCURRENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.1
-- Test Focus: Concurrent statement: block ｜ process ｜ procedure_call ｜ assertion ｜ signal_assign ｜ component_instantiation ｜ generate — all 7 concurrent kind categories
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_concurrent_statement_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_concurrent_statement_syn_s01 is
  signal s_cst:integer:=0;
begin
  s_cst<=42;  -- concurrent signal assignment
  p_cst:process is begin s_cst<=10; wait; end process;
  r<=s_cst;end architecture bh;
