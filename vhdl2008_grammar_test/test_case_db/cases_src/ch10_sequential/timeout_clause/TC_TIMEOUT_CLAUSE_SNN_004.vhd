-- =============================================================
-- Case ID: TC_TIMEOUT_CLAUSE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_TIMEOUT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: timeout_clause ::= for time_expression
-- Case Type: Negative
-- Test Focus: SNN: missing semicolon — `wait for 10 ns` directly followed by end process, the wait statement is not closed with a semicolon
-- Expected Result: Triggers syntax error: missing ';' after wait statement
-- Dependencies: None
-- =============================================================
entity tc_snn4_ent is port(y:out integer); end entity;
architecture bh of tc_snn4_ent is
begin
  process is
  begin
    wait for 10 ns
  end process;
end architecture bh;
