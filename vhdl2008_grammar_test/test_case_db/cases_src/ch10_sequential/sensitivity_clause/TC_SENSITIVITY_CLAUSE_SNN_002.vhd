-- =============================================================
-- Case ID: TC_SENSITIVITY_CLAUSE_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SENSITIVITY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_clause ::= on sensitivity_list
-- Case Type: Negative
-- Test Focus: SNN: on present but sensitivity_list missing — after `wait on` a semicolon or another clause follows directly, with no signal at all
-- Expected Result: Triggers syntax error: missing signal name after 'on'
-- Dependencies: None
-- =============================================================
entity sc_snn2_ent is port(y:out integer); end entity;
architecture bh of sc_snn2_ent is
begin
  process is
  begin
    wait on;
    y <= 1;
  end process;
end architecture bh;
