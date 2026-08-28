-- =============================================================
-- Case ID: TC_FORCE_ASSIGNMENT_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Negative
-- Test Focus: Missing expression after `<= force` -- bare `force` keyword with nothing after it violates conditional_expressions requirement
-- Expected Result: Triggers syntax error: missing expression after 'force'
-- Dependencies: None
-- =============================================================
entity force_asgn_snn_006 is
end entity force_asgn_snn_006;

architecture test of force_asgn_snn_006 is
  signal s_data : integer := 0;
begin
  process is
  begin
    s_data <= force;  -- ERROR: missing expression after force
    wait;
  end process;
end architecture test;
