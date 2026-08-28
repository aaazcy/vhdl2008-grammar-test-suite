-- =============================================================
-- Case ID: TC_FORCE_ASSIGNMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Negative
-- Test Focus: Missing the mandatory `force` keyword -- tests that `target <= expr` without force is a regular signal assignment, not force
-- Expected Result: Triggers syntax error: missing 'force' keyword
-- Dependencies: None
-- =============================================================
entity force_asgn_snn_001 is
end entity force_asgn_snn_001;

architecture test of force_asgn_snn_001 is
  signal s_data : integer := 0;
begin
  process is
  begin
    s_data <= 42;  -- NOTE: valid signal assignment, but NOT a force -- missing 'force' keyword
    wait;
  end process;
end architecture test;
