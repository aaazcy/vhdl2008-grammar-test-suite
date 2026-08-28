-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement ::= concurrent_assertion_statement | passive_concurrent_procedure_call_statement | passive_process_statement
-- Case Type: Positive
-- Test Focus: Entity statement part contains passive_process: the begin...end of the entity contains a passive process (no sensitivity list, with wait statement), verifying the entity-level statement part allows passive_process_statement as the sole entity_statement form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity es_passive is
  port(status:in integer);
end entity;
architecture bh of es_passive is
begin
  p_mon:process
  begin
    assert status>=0 report "status negative" severity warning;
    wait for 100 ns;
  end process;
end architecture bh;
