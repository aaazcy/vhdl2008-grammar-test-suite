-- =============================================================
-- Case ID: TC_CONCURRENT_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.1
-- Production: concurrent_statement ::= block_statement | process_statement | concurrent_procedure_call_statement | concurrent_assertion_statement | concurrent_signal_assignment_statement | component_instantiation_statement | generate_statement
-- Case Type: Negative
-- Test Focus: SNN: a wait statement appearing directly in a concurrent context——`wait on clk;` is not inside a process, verifying that wait is not a concurrent statement
-- Expected Result: Triggers syntax error: wait not allowed outside process
-- Dependencies: None
-- =============================================================
entity cs_snn4_ent is
  port(clk, d : in bit; q : out bit);
end entity cs_snn4_ent;
architecture bh of cs_snn4_ent is
begin
  wait on clk;
  q <= d;
end architecture bh;
