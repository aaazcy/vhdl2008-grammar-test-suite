-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_ENTITY_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement ::= concurrent_assertion_statement | passive_concurrent_procedure_call_statement | passive_process_statement | PSL_PSL_Directive
-- Case Type: Negative
-- Test Focus: concurrent_assertion of entity_statement referencing a nonexistent signal: the assert condition uses a signal name not defined in the entity ports or declarative part, verifying objects referenced in assertion conditions must be visible in scope
-- Expected Result: Triggers semantic error on undefined signal in assertion condition
-- Dependencies: None
-- =============================================================
entity es_smn2_ent is
  port(data:in integer);
end entity;
architecture bh of es_smn2_ent is
begin
  assert ghost_signal>0 report "invalid ghost" severity error;
end architecture bh;
