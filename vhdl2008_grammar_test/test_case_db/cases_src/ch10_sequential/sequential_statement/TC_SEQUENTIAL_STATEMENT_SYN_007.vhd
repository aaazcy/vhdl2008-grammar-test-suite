-- =============================================================
-- Case ID: TC_SEQUENTIAL_STATEMENT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENTIAL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequential_statement ::= wait_statement | ... | null_statement
-- Case Type: Positive
-- Test Focus: assertion_statement + report_statement as sequential_statement — assert and report statements inside a process
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sqs_syn7_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of sqs_syn7_ent is
begin
  process(a,b) is
  begin
    assert a >= 0 report "a is negative" severity warning;
    report "computing sum" severity note;
    y <= a + b;
  end process;
end architecture bh;
