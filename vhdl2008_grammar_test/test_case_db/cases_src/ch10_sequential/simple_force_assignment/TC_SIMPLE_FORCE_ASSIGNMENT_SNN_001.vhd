-- =============================================================
-- Case ID: TC_SIMPLE_FORCE_ASSIGNMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_force_assignment ::= target <= force [ force_mode ] expression ;
-- Case Type: Negative
-- Test Focus: Missing the mandatory `force` keyword between `<=` and the expression
-- Expected Result: Triggers syntax error: missing force keyword
-- Dependencies: None
-- =============================================================
entity simple_force_snn_001 is
end entity simple_force_snn_001;

architecture test of simple_force_snn_001 is
  signal s_bad : bit := '0';
begin
  process is
  begin
    s_bad <= in '1';       -- ERROR: missing 'force' keyword
    wait;
  end process;
end architecture test;
