-- =============================================================
-- Case ID: TC_TIMEOUT_CLAUSE_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_TIMEOUT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: timeout_clause ::= for time_expression
-- Case Type: Negative
-- Test Focus: SNN: non-time type expression — `wait for 5` integer 5 is not a time type value, missing the time unit
-- Expected Result: Triggers semantic error: time expression must be of type TIME
-- Dependencies: None
-- =============================================================
entity tc_snn2_ent is port(y:out integer); end entity;
architecture bh of tc_snn2_ent is
begin
  process is
  begin
    wait for 5;
    y <= 1;
  end process;
end architecture bh;
