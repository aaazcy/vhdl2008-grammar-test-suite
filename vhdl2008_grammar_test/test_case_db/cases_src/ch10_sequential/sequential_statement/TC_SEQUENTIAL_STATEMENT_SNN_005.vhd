-- =============================================================
-- Case ID: TC_SEQUENTIAL_STATEMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENTIAL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequential_statement ::= wait_statement | assertion_statement | ... | null_statement
-- Case Type: Negative
-- Test Focus: SNN: illegal keyword as a statement — a bare `entity;` in a process body is not any valid sequential_statement
-- Expected Result: Triggers syntax error: unexpected keyword 'entity' in statement position
-- Dependencies: None
-- =============================================================
entity sqs_snn5_ent is port(y:out integer); end entity;
architecture bh of sqs_snn5_ent is
begin
  process is
  begin
    entity;
    wait;
  end process;
end architecture bh;
