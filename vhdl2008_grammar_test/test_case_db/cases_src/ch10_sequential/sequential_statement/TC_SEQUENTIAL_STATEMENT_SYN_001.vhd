-- =============================================================
-- Case ID: TC_SEQUENTIAL_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENTIAL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequential_statement ::= wait_statement | assertion_statement | report_statement | signal_assignment_statement | variable_assignment_statement | procedure_call_statement | if_statement | case_statement | loop_statement | next_statement | exit_statement | return_statement | null_statement
-- Case Type: Positive
-- Test Focus: signal_assignment_statement as a sequential_statement — `s<=a` inside a process, verifying the signal assignment is a valid sequential_statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sqs_syn1_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sqs_syn1_ent is
  signal s : integer := 0;
begin
  process(a) is
  begin
    s <= a;
    y <= s;
  end process;
end architecture bh;
