-- =============================================================
-- Case ID: TC_SEQUENTIAL_STATEMENT_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENTIAL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequential_statement ::= wait_statement | assertion_statement | ... | null_statement
-- Case Type: Negative
-- Test Focus: SNN: process statement inside a process — nested process is not allowed
-- Expected Result: Triggers syntax error: process statement not allowed inside process
-- Dependencies: None
-- =============================================================
entity sqs_snn6_ent is port(y:out integer); end entity;
architecture bh of sqs_snn6_ent is
begin
  process is
  begin
    process is begin wait; end process;
    wait;
  end process;
end architecture bh;
