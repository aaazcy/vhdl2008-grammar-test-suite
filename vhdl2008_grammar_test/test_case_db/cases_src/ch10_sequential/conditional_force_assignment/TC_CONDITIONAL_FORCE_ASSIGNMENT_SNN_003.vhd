-- =============================================================
-- Case ID: TC_CONDITIONAL_FORCE_ASSIGNMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Negative
-- Test Focus: Missing the terminating semicolon after a conditional force assignment
-- Expected Result: Triggers syntax error: missing semicolon
-- Dependencies: None
-- =============================================================
entity cond_force_snn_003 is
end entity cond_force_snn_003;

architecture test of cond_force_snn_003 is
  signal s_bad : integer := 0;
  signal s_flag : boolean := true;
begin
  process is
  begin
    s_bad <= force 42 when s_flag else 0   -- ERROR: missing ';'
    wait;
  end process;
end architecture test;
