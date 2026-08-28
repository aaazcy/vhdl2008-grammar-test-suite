-- =============================================================
-- Case ID: TC_SENSITIVITY_CLAUSE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SENSITIVITY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_clause ::= on sensitivity_list
-- Case Type: Negative
-- Test Focus: SNN: illegal identifier used as a signal — `wait on 123` uses a numeric literal as an item in the sensitivity_list
-- Expected Result: Triggers syntax error: invalid signal name (expected identifier)
-- Dependencies: None
-- =============================================================
entity sc_snn4_ent is port(y:out integer); end entity;
architecture bh of sc_snn4_ent is
begin
  process is
  begin
    wait on 123;
    y <= 1;
  end process;
end architecture bh;
