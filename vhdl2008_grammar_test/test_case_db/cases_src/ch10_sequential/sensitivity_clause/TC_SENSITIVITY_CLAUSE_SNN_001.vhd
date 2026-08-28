-- =============================================================
-- Case ID: TC_SENSITIVITY_CLAUSE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SENSITIVITY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_clause ::= on sensitivity_list
-- Case Type: Negative
-- Test Focus: SNN: Missing on keyword — `wait clk` places a signal name directly after wait, with no on prefix
-- Expected Result: Triggers syntax error: missing 'on' keyword in wait statement
-- Dependencies: None
-- =============================================================
entity sc_snn1_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of sc_snn1_ent is
begin
  process is
  begin
    wait clk;
    y <= 1;
  end process;
end architecture bh;
