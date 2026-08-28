-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_ENTITY_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement ::= concurrent_assertion_statement | passive_concurrent_procedure_call_statement | passive_process_statement | PSL_PSL_Directive
-- Case Type: Negative
-- Test Focus: signal assignment inside the passive_process of entity_statement: process p_active in the entity statement part executes s<=a driving a signal, violating the semantic rule that processes in entity statements must be passive (not driving signals)
-- Expected Result: Triggers semantic error: signal statement forbidden in passive process
-- Dependencies: None
-- =============================================================
entity es_smn1_ent is
  port(a:in bit; y:out bit);
  signal s:bit;
begin
  p_active : process(a)
  begin
    s <= a;
  end process;
end entity;
