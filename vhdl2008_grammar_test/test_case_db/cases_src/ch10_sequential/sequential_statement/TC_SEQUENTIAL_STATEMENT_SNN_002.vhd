-- =============================================================
-- Case ID: TC_SEQUENTIAL_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENTIAL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequential_statement ::= wait_statement | assertion_statement | ... | null_statement
-- Case Type: Negative
-- Test Focus: SNN: signal declaration in statement position — in a process body `signal s:bit;` the declaration is not allowed in the statement part
-- Expected Result: Triggers syntax error: signal declaration not allowed in statement part
-- Dependencies: None
-- =============================================================
entity sqs_snn2_ent is port(y:out integer); end entity;
architecture bh of sqs_snn2_ent is
begin
  process is
  begin
    signal s : bit;
    y <= 1;
    wait;
  end process;
end architecture bh;
