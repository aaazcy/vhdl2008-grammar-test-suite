-- =============================================================
-- Case ID: TC_CONCURRENT_PROCEDURE_CALL_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.4
-- Production: concurrent_procedure_call_statement ::= [ label : ] [ postponed ] procedure_call ;
-- Case Type: Positive
-- Test Focus: concurrent procedure call with label+postponed: a labeled concurrent procedure call (monitor) + a postponed concurrent procedure call (checker), verifying the syntax of the label and postponed keywords of concurrent_procedure_call in the concurrent context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cpc_ent is port(clk:in bit; data:in integer); end entity;
architecture bh of cpc_ent is
  signal s_data:integer:=0;
  procedure p_log(signal v:in integer; tag:string) is
  begin report tag & "=" & integer'image(v) severity note; end procedure;
begin
  s_data<=data;
  mon:p_log(v=>s_data, tag=>"monitor");
  checker: postponed p_log(s_data, "checker");
end architecture bh;
