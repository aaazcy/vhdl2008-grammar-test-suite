-- =============================================================
-- Case ID: TC_CONDITIONAL_FORCE_ASSIGNMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Negative
-- Test Focus: Missing the mandatory `force` keyword in a conditional force assignment
-- Expected Result: Triggers syntax error: missing force keyword
-- Dependencies: None
-- =============================================================
entity cond_force_snn_001 is
end entity cond_force_snn_001;

architecture test of cond_force_snn_001 is
  signal s_bad : integer := 0;
begin
  process is
  begin
    s_bad <= 10 when true else 20;  -- ERROR: missing 'force' keyword
    wait;
  end process;
end architecture test;
