-- =============================================================
-- Case ID: TC_CONCURRENT_PROCEDURE_CALL_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONCURRENT_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.4
-- Production: concurrent_procedure_call_statement ::= [ label : ] [ postponed ] procedure_call ;
-- Rule Description: A concurrent procedure call actual parameter must be compatible with the formal parameter's class (signal/variable/constant); actuals for signal-class formals must be signals
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: actual parameter type does not match the formal — the formal is of signal class but the actual passes the literal '0' (not a signal), verifying that a signal-class formal parameter must be bound to a signal actual
-- Expected Result: Triggers semantic error: actual must be a signal for signal-class formal parameter
-- Dependencies: None
-- =============================================================
entity cpc_smn1_ent is
  port(clk : in bit; q : out bit);
end entity cpc_smn1_ent;
architecture bh of cpc_smn1_ent is
  procedure bad_drive(signal rst_val : in bit; signal out_q : out bit) is
  begin
    out_q <= rst_val;
  end procedure bad_drive;
begin
  bad_drive('0', q);
end architecture bh;
