-- =============================================================
-- Case ID: TC_CONDITIONAL_FORCE_ASSIGNMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Negative
-- Test Focus: Missing expression before the `when` keyword in conditional force expression
-- Expected Result: Triggers syntax error: missing expression before when
-- Dependencies: None
-- =============================================================
entity cond_force_snn_005 is
end entity cond_force_snn_005;

architecture test of cond_force_snn_005 is
  signal s_bad : integer := 0;
begin
  process is
  begin
    s_bad <= force when true else 0;  -- ERROR: missing expression before 'when'
    wait;
  end process;
end architecture test;
