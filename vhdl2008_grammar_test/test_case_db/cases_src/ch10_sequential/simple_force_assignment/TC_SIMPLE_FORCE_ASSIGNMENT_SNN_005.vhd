-- =============================================================
-- Case ID: TC_SIMPLE_FORCE_ASSIGNMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_force_assignment ::= target <= force [ force_mode ] expression ;
-- Case Type: Negative
-- Test Focus: Missing the mandatory expression after the force keyword (and optional force_mode)
-- Expected Result: Triggers syntax error: missing expression
-- Dependencies: None
-- =============================================================
entity simple_force_snn_005 is
end entity simple_force_snn_005;

architecture test of simple_force_snn_005 is
  signal s_bad : integer := 0;
begin
  process is
  begin
    s_bad <= force in;      -- ERROR: missing expression before ';'
    wait;
  end process;
end architecture test;
