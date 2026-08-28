-- =============================================================
-- Case ID: TC_CONCURRENT_PROCEDURE_CALL_STATEMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.4
-- Production: concurrent_procedure_call_statement ::= [ label : ] [ postponed ] procedure_call ;
-- Case Type: Negative
-- Test Focus: SNN: missing colon after label — `my_label my_proc(a,b,y)` places the label directly before the procedure name with no colon separator, verifying that there must be a colon between the label and the call of a labeled procedure call
-- Expected Result: Triggers syntax error: missing ":" after concurrent procedure call label
-- Dependencies: None
-- =============================================================
entity cpc_snn5_ent is
  port(a, b : in bit; y : out bit);
end entity cpc_snn5_ent;
architecture bh of cpc_snn5_ent is
  procedure my_proc(signal x, y_sig : in bit; signal z : out bit) is
  begin
    z <= x xor y_sig;
  end procedure my_proc;
begin
  my_label my_proc(a, b, y);
end architecture bh;
