-- =============================================================
-- Case ID: TC_CONCURRENT_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.1
-- Production: concurrent_statement ::= block_statement | process_statement | concurrent_procedure_call_statement | concurrent_assertion_statement | concurrent_signal_assignment_statement | component_instantiation_statement | generate_statement
-- Case Type: Negative
-- Test Focus: SNN: a sequential statement appearing directly in a concurrent context——`if a = '1' then y <= b; end if;` is not wrapped in a process, verifying that an if statement is not a concurrent statement and must be inside a process
-- Expected Result: Triggers syntax error: sequential statement not allowed as concurrent statement
-- Dependencies: None
-- =============================================================
entity cs_snn1_ent is
  port(a, b : in bit; y : out bit);
end entity cs_snn1_ent;
architecture bh of cs_snn1_ent is
begin
  if a = '1' then
    y <= b;
  end if;
end architecture bh;
