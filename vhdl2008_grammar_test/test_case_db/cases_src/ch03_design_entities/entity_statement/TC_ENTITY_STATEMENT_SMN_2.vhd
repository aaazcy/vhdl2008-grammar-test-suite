-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_ENTITY_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement ::= concurrent_assertion_statement | passive_concurrent_procedure_call_statement | passive_process_statement | PSL_PSL_Directive
-- Case Type: Negative
-- Test Focus: default clock in the PSL directive of entity_statement references a non-bit type signal: default clock uses an integer type signal instead of bit/boolean, verifying the semantic constraint that PSL clock signals must be of bit or boolean type
-- Expected Result: Triggers semantic error on invalid clock type in PSL directive
-- Dependencies: None
-- =============================================================
entity es_sem1_ent is
  port(clk_int:in integer; ack:in bit);
end entity;
architecture bh of es_sem1_ent is
begin
  default clock is rising_edge(clk_int);
  assert always ack;
end architecture bh;
