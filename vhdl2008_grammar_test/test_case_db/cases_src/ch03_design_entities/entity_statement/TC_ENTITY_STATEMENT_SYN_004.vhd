-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement ::= concurrent_assertion_statement | passive_concurrent_procedure_call_statement | passive_process_statement | PSL_PSL_Directive
-- Case Type: Positive
-- Test Focus: Entity statement part contains PSL directive: the begin...end of the entity contains a PSL assert directive (default clock followed by an always property assertion), verifying PSL_PSL_Directive as the fourth legal form of entity_statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity es_psl_ent is
  port(clk:in bit; req,ack:in bit);
end entity es_psl_ent;
architecture bh of es_psl_ent is
begin
  default clock is rising_edge(clk);
  assert always req -> eventually! ack;
end architecture bh;
