-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement ::= concurrent_assertion_statement passive_concurrent_procedure_call_statement | passive_process_statement | PSL_PSL_Directive
-- Case Type: Negative
-- Test Focus: entity_statement: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity entity_statemen_e2 is end entity;
architecture bh of entity_statemen_e2 is
  -- ERROR: invalid syntax in entity_statement
  signal s : bit;
begin
  s <= '1'
end architecture bh;