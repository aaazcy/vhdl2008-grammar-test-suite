-- =============================================================
-- Case ID: TC_CONCURRENT_PROCEDURE_CALL_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.4
-- Production: concurrent_procedure_call_statement ::= [ label : ] [ postponed ] procedure_call ;
-- Case Type: Negative
-- Test Focus: SNN: call to a non-existent procedure — `undefined_proc(sig)` references an undeclared procedure name, verifying that the name referenced by a procedure call must be visible in scope
-- Expected Result: Triggers semantic error: procedure "undefined_proc" not declared
-- Dependencies: None
-- =============================================================
entity cpc_snn4_ent is
  port(a : in bit; y : out bit);
end entity cpc_snn4_ent;
architecture bh of cpc_snn4_ent is
begin
  undefined_proc(a, y);
end architecture bh;
