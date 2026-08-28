-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_017
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Architecture containing only passive concurrent procedure calls: statement part consists of 2 concurrent_procedure_call_statements (both passive procedures, driving no signals), verifying entity_statement and architecture_statement_part allow passive concurrent procedure calls as the only concurrent statement form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_passive_ent is
  port(clk:in bit; sig_out:out integer);
end entity;
architecture passive of arch_passive_ent is
  signal s_counter:integer:=0;
  procedure p_report_counter(signal v:in integer) is
  begin
    report "[passive] counter=" & integer'image(v) severity note;
  end procedure;
  procedure p_tick(signal v:inout integer) is
  begin
    v<=v+1;
  end procedure;
begin
  p_tick(s_counter);
  p_report_counter(s_counter);
  sig_out<=s_counter;
end architecture passive;
