-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement ::= concurrent_assertion_statement | passive_concurrent_procedure_call_statement | passive_process_statement | PSL_PSL_Directive
-- Case Type: Negative
-- Test Focus: non-passive form (signal_assignment) in entity_statement: a concurrent signal assignment y<=a (a non-passive concurrent statement) is placed in the entity statement part, verifying entity_statement only allows passive forms of statements
-- Expected Result: Triggers syntax error: signal assignment forbidden in entity
-- Dependencies: None
-- =============================================================
entity es_snn1_ent is
  port(a:in bit; y:out bit);
begin
  y <= a;
end entity;
