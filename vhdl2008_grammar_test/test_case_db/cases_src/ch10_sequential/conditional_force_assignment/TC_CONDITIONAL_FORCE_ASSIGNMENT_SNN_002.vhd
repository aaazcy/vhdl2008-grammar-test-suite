-- =============================================================
-- Case ID: TC_CONDITIONAL_FORCE_ASSIGNMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Negative
-- Test Focus: Missing the `when` keyword before the condition in a conditional force expression
-- Expected Result: Triggers syntax error: missing when keyword
-- Dependencies: None
-- =============================================================
entity cond_force_snn_002 is
end entity cond_force_snn_002;

architecture test of cond_force_snn_002 is
  signal s_bad : bit := '0';
begin
  process is
  begin
    s_bad <= force '1' true else '0';  -- ERROR: missing 'when' before condition
    wait;
  end process;
end architecture test;
