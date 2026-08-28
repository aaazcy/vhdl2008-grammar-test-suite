-- =============================================================
-- Case ID: TC_CONDITIONAL_FORCE_ASSIGNMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Negative
-- Test Focus: Using wrong arrow operator `=>` instead of `<=` for force signal assignment
-- Expected Result: Triggers syntax error: invalid assignment operator
-- Dependencies: None
-- =============================================================
entity cond_force_snn_004 is
end entity cond_force_snn_004;

architecture test of cond_force_snn_004 is
  signal s_bad : bit := '0';
begin
  process is
  begin
    s_bad => force '1' when true else '0';  -- ERROR: '=>' instead of '<='
    wait;
  end process;
end architecture test;
