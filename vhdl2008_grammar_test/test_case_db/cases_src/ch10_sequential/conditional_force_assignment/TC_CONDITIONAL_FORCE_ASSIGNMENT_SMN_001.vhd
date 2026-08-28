-- =============================================================
-- Case ID: TC_CONDITIONAL_FORCE_ASSIGNMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Rule Description: Conditional force assignment is only valid in sequential context (process/subprogram)
-- Case Type: Negative
-- Test Focus: Conditional force used as concurrent statement outside any process should fail
-- Expected Result: Triggers semantic error: force not allowed in concurrent context
-- Dependencies: None
-- =============================================================
entity cond_force_smn_001 is
end entity cond_force_smn_001;

architecture test of cond_force_smn_001 is
  signal s_bad : integer := 0;
  signal s_sel : boolean := true;
begin
  s_bad <= force 10 when s_sel else 0;  -- ERROR: force used concurrently
end architecture test;
