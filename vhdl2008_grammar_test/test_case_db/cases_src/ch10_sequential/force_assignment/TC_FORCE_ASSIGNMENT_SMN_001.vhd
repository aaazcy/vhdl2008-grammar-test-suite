-- =============================================================
-- Case ID: TC_FORCE_ASSIGNMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Rule Description: Force assignment is only valid in sequential context (process/subprogram), not concurrent
-- Case Type: Negative
-- Test Focus: Force used as a concurrent statement outside any process -- tests that force in concurrent context triggers error
-- Expected Result: Triggers semantic error: force not allowed in concurrent context
-- Dependencies: None
-- =============================================================
entity force_asgn_smn_001 is
end entity force_asgn_smn_001;

architecture test of force_asgn_smn_001 is
  signal s_bad : integer := 0;
begin
  s_bad <= force 10;  -- ERROR: force used concurrently
end architecture test;
