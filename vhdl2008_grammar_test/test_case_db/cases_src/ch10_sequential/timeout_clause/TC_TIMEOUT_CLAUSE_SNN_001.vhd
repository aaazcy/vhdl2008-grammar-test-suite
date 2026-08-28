-- =============================================================
-- Case ID: TC_TIMEOUT_CLAUSE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_TIMEOUT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: timeout_clause ::= for time_expression
-- Case Type: Negative
-- Test Focus: SNN: missing time_expression after for — `wait for` directly followed by a semicolon, no time value
-- Expected Result: Triggers syntax error: missing time expression after 'for'
-- Dependencies: None
-- =============================================================
entity tc_snn1_ent is port(y:out integer); end entity;
architecture bh of tc_snn1_ent is
begin
  process is
  begin
    wait for;
    y <= 1;
  end process;
end architecture bh;
