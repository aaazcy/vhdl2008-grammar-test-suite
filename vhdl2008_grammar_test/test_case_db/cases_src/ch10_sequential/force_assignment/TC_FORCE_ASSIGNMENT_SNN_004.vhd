-- =============================================================
-- Case ID: TC_FORCE_ASSIGNMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Negative
-- Test Focus: Wrong operator `=>` used instead of `<=` for force assignment -- tests that `=>` is rejected in this context
-- Expected Result: Triggers syntax error: wrong assignment operator
-- Dependencies: None
-- =============================================================
entity force_asgn_snn_004 is
end entity force_asgn_snn_004;

architecture test of force_asgn_snn_004 is
  signal s_data : integer := 0;
begin
  process is
  begin
    s_data => force 42;  -- ERROR: '=>' not valid as assignment operator
    wait;
  end process;
end architecture test;
