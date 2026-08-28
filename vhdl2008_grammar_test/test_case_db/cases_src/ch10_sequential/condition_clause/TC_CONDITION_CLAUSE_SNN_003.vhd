-- =============================================================
-- Case ID: TC_CONDITION_CLAUSE_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: condition_clause ::= until condition
-- Case Type: Negative
-- Test Focus: SNN: condition without a boolean operator - `wait until 1` an integer constant is not a boolean expression
-- Expected Result: Triggers semantic error: condition must be boolean type
-- Dependencies: None
-- =============================================================
entity cc_snn3_ent is port(y:out integer); end entity;
architecture bh of cc_snn3_ent is
begin
  process is
  begin
    wait until 1;
    y <= 1;
  end process;
end architecture bh;
