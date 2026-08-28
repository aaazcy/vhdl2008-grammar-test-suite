-- =============================================================
-- Case ID: TC_SIMPLE_FORCE_ASSIGNMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_force_assignment ::= target <= force [ force_mode ] expression ;
-- Rule Description: Force assignment is only valid in sequential context (process/subprogram)
-- Case Type: Negative
-- Test Focus: Force assignment placed outside any process as a concurrent statement should fail
-- Expected Result: Triggers semantic error: force not allowed in concurrent context
-- Dependencies: None
-- =============================================================
entity simple_force_smn_001 is
end entity simple_force_smn_001;

architecture test of simple_force_smn_001 is
  signal s_bad : bit := '0';
begin
  s_bad <= force '1';       -- ERROR: force used concurrently, must be inside process
end architecture test;
