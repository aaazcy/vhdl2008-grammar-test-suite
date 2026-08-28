-- =============================================================
-- Case ID: TC_TIMEOUT_CLAUSE_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_TIMEOUT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: timeout_clause ::= for time_expression
-- Case Type: Negative
-- Test Focus: SNN: wrong keyword — `wait fro 10 ns` misspelled fro instead of for
-- Expected Result: Triggers syntax error: unrecognized keyword 'fro', expected 'for'
-- Dependencies: None
-- =============================================================
entity tc_snn3_ent is port(y:out integer); end entity;
architecture bh of tc_snn3_ent is
begin
  process is
  begin
    wait fro 10 ns;
    y <= 1;
  end process;
end architecture bh;
