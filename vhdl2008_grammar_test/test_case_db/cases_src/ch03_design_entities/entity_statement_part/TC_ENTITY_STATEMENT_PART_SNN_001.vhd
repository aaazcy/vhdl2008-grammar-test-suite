-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_PART_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement_part ::= { entity_statement }
-- Case Type: Negative
-- Test Focus: SNN: non-passive statement in the entity statement part — concurrent_signal_assignment(y<=a) is an active concurrent statement, entity_statement only allows passive statements (concurrent_assertion/passive process/concurrent_procedure_call), verifying signal assignment does not belong to entity_statement
-- Expected Result: Triggers syntax error: active concurrent statement not allowed in entity statement part
-- Dependencies: None
-- =============================================================
entity esp_snn1_ent is
  port(a:in bit; y:out bit);
begin
  y<=a;
end entity esp_snn1_ent;
architecture bh of esp_snn1_ent is
begin end architecture bh;
