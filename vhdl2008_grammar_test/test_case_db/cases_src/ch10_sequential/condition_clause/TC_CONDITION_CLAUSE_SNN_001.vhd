-- =============================================================
-- Case ID: TC_CONDITION_CLAUSE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: condition_clause ::= until condition
-- Case Type: Negative
-- Test Focus: SNN: condition missing after until - a semicolon directly follows `wait until`, with no boolean expression
-- Expected Result: Triggers syntax error: missing condition after 'until'
-- Dependencies: None
-- =============================================================
entity cc_snn1_ent is port(y:out integer); end entity;
architecture bh of cc_snn1_ent is
begin
  process is
  begin
    wait until;
    y <= 1;
  end process;
end architecture bh;
