-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ENTITY_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Test Focus: Entity statement: concurrent_assertion ｜ passive_concurrent_procedure_call ｜ passive_process
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_entity_statement_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_entity_statement_syn_s01 is
    signal s_es:integer:=0;
begin
  assert s_es>=0 report "entity stmt check" severity note;
  p_passive:process is begin s_es<=s_es+1; wait for 10 ns; end process; r<=s_es;end architecture bh;
