-- =============================================================
-- Case ID: TC_CONDITIONAL_FORCE_ASSIGNMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SMN_FORCE_TARGET
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Rule Description: Force assignment target must be a signal, not a variable
-- Case Type: Negative
-- Test Focus: Attempting to use conditional force on a variable (force only works on signals)
-- Expected Result: Triggers semantic error: force target must be a signal
-- Dependencies: None
-- =============================================================
entity cond_force_smn_002 is
end entity cond_force_smn_002;

architecture test of cond_force_smn_002 is
  signal s_result : integer := 0;
begin
  process is
    variable v_bad : integer := 0;
  begin
    v_bad <= force 10 when true else 0;  -- ERROR: force on variable
    s_result <= v_bad;
    wait;
  end process;
end architecture test;
