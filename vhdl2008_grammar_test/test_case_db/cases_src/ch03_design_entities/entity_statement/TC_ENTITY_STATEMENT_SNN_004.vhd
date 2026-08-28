-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement ::= concurrent_assertion_statement | passive_concurrent_procedure_call_statement | passive_process_statement | PSL_PSL_Directive
-- Case Type: Negative
-- Test Focus: concurrent_assertion of entity_statement missing the assert keyword: condition report... is written directly without the assert prefix, verifying the required assert keyword of concurrent assertion statements
-- Expected Result: Triggers syntax error on missing 'assert' keyword
-- Dependencies: None
-- =============================================================
entity es_snn4_ent is
  port(status:in integer);
end entity;
architecture bh of es_snn4_ent is
begin
  status>=0 report "status negative" severity warning;
end architecture bh;
