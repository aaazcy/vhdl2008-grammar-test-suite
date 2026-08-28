-- =============================================================
-- Case ID: TC_SEQUENTIAL_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENTIAL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequential_statement ::= wait_statement | assertion_statement | ... | null_statement
-- Case Type: Negative
-- Test Focus: SNN: wait statement in a process with a sensitivity_list — process(clk) has a sensitivity list but the body also contains wait
-- Expected Result: Triggers syntax error: wait statement not allowed in process with sensitivity list
-- Dependencies: None
-- =============================================================
entity sqs_snn4_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of sqs_snn4_ent is
begin
  process(clk) is
  begin
    wait on clk;
    y <= 1;
  end process;
end architecture bh;
