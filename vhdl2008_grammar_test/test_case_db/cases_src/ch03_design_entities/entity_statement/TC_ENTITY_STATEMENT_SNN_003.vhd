-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement ::= concurrent_assertion_statement passive_concurrent_procedure_call_statement | passive_process_statement | PSL_PSL_Directive
-- Case Type: Negative
-- Test Focus: entity_statement: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity entity_statemen_e3 is end entity;
architecture bh of entity_statemen_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;