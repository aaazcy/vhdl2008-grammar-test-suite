-- =============================================================
-- Case ID: TC_CONDITION_CLAUSE_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: condition_clause ::= until condition
-- Case Type: Negative
-- Test Focus: SNN: misspelled keyword variant of until - `wait untill clk='1'` misspells untill with one extra l
-- Expected Result: Triggers syntax error: unrecognized keyword 'untill'
-- Dependencies: None
-- =============================================================
entity cc_snn2_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of cc_snn2_ent is
begin
  process is
  begin
    wait untill clk = '1';
    y <= 1;
  end process;
end architecture bh;
