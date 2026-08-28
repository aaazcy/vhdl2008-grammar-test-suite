-- =============================================================
-- Case ID: TC_SENSITIVITY_CLAUSE_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SENSITIVITY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_clause ::= on sensitivity_list
-- Case Type: Negative
-- Test Focus: SNN: wrong separator used in sensitivity_list — `wait on a;b` uses a semicolon instead of a comma to separate the signals
-- Expected Result: Triggers syntax error: expected ',' between signal names, found ';'
-- Dependencies: None
-- =============================================================
entity sc_snn3_ent is port(a,b:in bit; y:out integer); end entity;
architecture bh of sc_snn3_ent is
begin
  process is
  begin
    wait on a;b;
    y <= 1;
  end process;
end architecture bh;
