-- =============================================================
-- Case ID: TC_CONCURRENT_PROCEDURE_CALL_STATEMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONCURRENT_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.4
-- Production: concurrent_procedure_call_statement ::= [ label : ] [ postponed ] procedure_call ;
-- Rule Description: A concurrent procedure call must supply exactly the right number of actual parameters; too few or too many actuals cause an error
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: parameter count mismatch — the procedure defines 3 formal parameters but the call passes only 1 actual, verifying that the numbers of actual and formal parameters of a concurrent procedure call must agree
-- Expected Result: Triggers semantic error: wrong number of actual parameters
-- Dependencies: None
-- =============================================================
entity cpc_smn2_ent is
  port(a, b : in bit; y : out bit);
end entity cpc_smn2_ent;
architecture bh of cpc_smn2_ent is
  procedure three_param(signal x, y_sig : in bit; signal z : out bit) is
  begin
    z <= x nand y_sig;
  end procedure three_param;
begin
  three_param(a);
end architecture bh;
