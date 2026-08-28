-- =============================================================
-- Case ID: TC_SELECTED_FORCE_ASSIGNMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_force_assignment ::= with expression select [ ? ] target <= force [ force_mode ] selected_expressions ;
-- Rule Description: Selected force assignment is only valid in sequential context (process/subprogram)
-- Case Type: Negative
-- Test Focus: Selected force used as a concurrent statement outside any process -- tests that force in concurrent context triggers error
-- Expected Result: Triggers semantic error: selected force not allowed in concurrent context
-- Dependencies: None
-- =============================================================
entity sel_force_smn_001 is
end entity sel_force_smn_001;

architecture test of sel_force_smn_001 is
  signal s_sel    : integer := 0;
  signal s_target : integer := 0;
begin
  with s_sel select s_target <= force 10 when others;  -- ERROR: force used concurrently
end architecture test;
