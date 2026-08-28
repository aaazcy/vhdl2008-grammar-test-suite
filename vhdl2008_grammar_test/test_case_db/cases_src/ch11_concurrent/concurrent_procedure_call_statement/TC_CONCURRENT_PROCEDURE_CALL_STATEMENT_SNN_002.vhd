-- =============================================================
-- Case ID: TC_CONCURRENT_PROCEDURE_CALL_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.4
-- Production: concurrent_procedure_call_statement ::= [ label : ] [ postponed ] procedure_call ;
-- Case Type: Negative
-- Test Focus: concurrent_procedure_call_statement: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity concurrent_proc_e2 is end entity;
architecture bh of concurrent_proc_e2 is
  -- ERROR: invalid syntax in concurrent_procedure_call_statement
  signal s : bit;
begin
  s <= '1'
end architecture bh;