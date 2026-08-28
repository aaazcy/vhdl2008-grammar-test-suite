-- =============================================================
-- Case ID: TC_CONDITION_CLAUSE_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: condition_clause ::= until condition
-- Case Type: Negative
-- Test Focus: SNN: missing semicolon after condition - end process directly follows `wait until clk='1'`, missing the semicolon closing the wait statement
-- Expected Result: Triggers syntax error: missing ';' after wait statement
-- Dependencies: None
-- =============================================================
entity cc_snn4_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of cc_snn4_ent is
begin
  process is
  begin
    wait until clk = '1'
  end process;
end architecture bh;
