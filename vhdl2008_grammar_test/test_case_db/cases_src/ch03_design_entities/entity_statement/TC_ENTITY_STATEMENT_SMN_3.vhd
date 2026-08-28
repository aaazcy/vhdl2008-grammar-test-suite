-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_ENTITY_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement ::= concurrent_assertion_statement | passive_concurrent_procedure_call_statement | passive_process_statement | PSL_PSL_Directive
-- Case Type: Negative
-- Test Focus: the procedure called by the concurrent_procedure_call of entity_statement contains non-passive operations: the called procedure p_drive performs signal assignment internally (non-passive behavior), verifying concurrent procedure calls in the entity statement part must reference passive procedures
-- Expected Result: Triggers semantic error: procedure p_drive is not passive
-- Dependencies: None
-- =============================================================
entity es_sem2_ent is
  port(a:in bit; y:out bit);
  procedure p_drive(signal x:in bit; signal z:out bit) is
  begin
    z <= x;
  end procedure;
begin
  p_drive(a, y);
end entity;
