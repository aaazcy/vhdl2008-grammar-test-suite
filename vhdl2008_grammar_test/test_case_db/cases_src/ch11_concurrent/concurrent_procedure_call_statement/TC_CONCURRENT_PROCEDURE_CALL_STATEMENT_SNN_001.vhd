-- =============================================================
-- Case ID: TC_CONCURRENT_PROCEDURE_CALL_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.4
-- Production: concurrent_procedure_call_statement ::= [ label : ] [ postponed ] procedure_call ;
-- Case Type: Negative
-- Test Focus: SNN: procedure_call missing semicolon — `my_proc(a, b)` has no trailing semicolon, verifying that a concurrent procedure call statement must terminate with a semicolon
-- Expected Result: Triggers syntax error: missing ";" after concurrent procedure call
-- Dependencies: None
-- =============================================================
entity cpc_snn1_ent is
  port(a, b : in bit; y : out bit);
end entity cpc_snn1_ent;
architecture bh of cpc_snn1_ent is
  procedure my_proc(signal x, y_sig : in bit; signal z : out bit) is
  begin
    z <= x and y_sig;
  end procedure my_proc;
begin
  my_proc(a, b, y)
end architecture bh;
