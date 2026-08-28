-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement ::= concurrent_assertion_statement | passive_concurrent_procedure_call_statement | passive_process_statement | PSL_PSL_Directive
-- Case Type: Negative
-- Test Focus: illegal actual argument of the concurrent_procedure_call of entity_statement: the actual argument in the procedure call is an undeclared identifier, verifying actual arguments of concurrent procedure calls must be visible and type-matched
-- Expected Result: Triggers syntax error on undefined argument identifier
-- Dependencies: None
-- =============================================================
entity es_snn6_ent is
  port(data:in integer);
end entity;
architecture bh of es_snn6_ent is
  procedure p_check(signal v:in integer) is
  begin
    assert v>=0 severity warning;
  end procedure;
begin
  p_check(no_such_signal);
end architecture bh;
