-- =============================================================
-- Case ID: TC_CONDITIONAL_FORCE_ASSIGNMENT_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Negative
-- Test Focus: Missing condition after the `when` keyword in conditional force expression
-- Expected Result: Triggers syntax error: missing condition after when
-- Dependencies: None
-- =============================================================
entity cond_force_snn_006 is
end entity cond_force_snn_006;

architecture test of cond_force_snn_006 is
  signal s_bad : bit := '0';
begin
  process is
  begin
    s_bad <= force '1' when else '0';  -- ERROR: missing condition after 'when'
    wait;
  end process;
end architecture test;
