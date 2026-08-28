-- =============================================================
-- Case ID: TC_SEQUENTIAL_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENTIAL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequential_statement ::= wait_statement | assertion_statement | ... | null_statement
-- Case Type: Negative
-- Test Focus: SNN: entity instantiation statement inside a process — `u:entity work.X` is a concurrent statement and cannot be a sequential_statement
-- Expected Result: Triggers syntax error: component instantiation not allowed in sequential context
-- Dependencies: None
-- =============================================================
entity sqs_snn1_ent is port(y:out integer); end entity;
architecture bh of sqs_snn1_ent is
  component c_dummy is port(x:out integer); end component;
begin
  process is
  begin
    u_inst: c_dummy port map(y);
    wait;
  end process;
end architecture bh;
