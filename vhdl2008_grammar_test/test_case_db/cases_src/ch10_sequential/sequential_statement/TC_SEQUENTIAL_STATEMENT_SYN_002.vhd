-- =============================================================
-- Case ID: TC_SEQUENTIAL_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENTIAL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequential_statement ::= wait_statement | assertion_statement | report_statement | signal_assignment_statement | variable_assignment_statement | procedure_call_statement | if_statement | case_statement | loop_statement | next_statement | exit_statement | return_statement | null_statement
-- Case Type: Positive
-- Test Focus: variable_assignment_statement as a sequential_statement — variable assignment `v:=a+b` inside a process
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sqs_syn2_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of sqs_syn2_ent is
begin
  process(a,b) is
    variable v : integer;
  begin
    v := a + b;
    y <= v;
  end process;
end architecture bh;
