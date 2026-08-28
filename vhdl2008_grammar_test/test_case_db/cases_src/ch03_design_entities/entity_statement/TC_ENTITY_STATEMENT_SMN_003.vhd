-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_ENTITY_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement ::= concurrent_assertion_statement | passive_concurrent_procedure_call_statement | passive_process_statement | PSL_PSL_Directive
-- Case Type: Negative
-- Test Focus: nonexistent property name in the PSL directive of entity_statement: assert always prop_name references an undefined or invisible PSL property name, verifying the visibility rules for property names in PSL directives
-- Expected Result: Triggers semantic error on undefined PSL property name
-- Dependencies: None
-- =============================================================
entity es_smn3_ent is
  port(clk:in bit; req:in bit);
end entity;
architecture bh of es_smn3_ent is
begin
  default clock is rising_edge(clk);
  assert always undefined_property;
end architecture bh;
