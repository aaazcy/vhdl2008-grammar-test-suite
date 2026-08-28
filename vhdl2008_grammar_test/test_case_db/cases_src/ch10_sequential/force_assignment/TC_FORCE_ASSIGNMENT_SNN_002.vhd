-- =============================================================
-- Case ID: TC_FORCE_ASSIGNMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Negative
-- Test Focus: Missing target before `<=` -- tests that an assignment operator without a left-hand target triggers error
-- Expected Result: Triggers syntax error: missing target
-- Dependencies: None
-- =============================================================
entity force_asgn_snn_002 is
end entity force_asgn_snn_002;

architecture test of force_asgn_snn_002 is
begin
  process is
  begin
    <= force 10;  -- ERROR: missing target
    wait;
  end process;
end architecture test;
