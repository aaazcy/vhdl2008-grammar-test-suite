-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.7
-- Production: procedure_call_statement ::= [ label : ] procedure_call ;
-- Case Type: Positive
-- Test Focus: Labeled procedure call with named + positional params: with label "p_log", calling procedure p_report using named association (signal=>s_val) + positional association mixed, verifying the label of the procedure_call and mixed association in actual_parameter_part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pcs_ent is port(val:in integer; y:out integer); end entity;
architecture bh of pcs_ent is
  procedure p_report(signal v:in integer; tag:string) is
  begin report tag & "=" & integer'image(v) severity note; end procedure;
  signal s_val:integer:=0;
begin
  process(val) begin
    s_val<=val;
    p_log:p_report(v=>s_val, tag=>"value");
    y<=s_val;
  end process;
end architecture bh;
