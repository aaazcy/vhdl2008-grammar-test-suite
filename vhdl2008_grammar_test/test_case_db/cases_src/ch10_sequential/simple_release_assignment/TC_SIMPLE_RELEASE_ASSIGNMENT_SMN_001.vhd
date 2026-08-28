-- =============================================================
-- Case ID: TC_SIMPLE_RELEASE_ASSIGNMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_026
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_release_assignment ::= target <= release [ force_mode ] ;
-- Rule Description: Release assignment is only valid in sequential context (process/subprogram)
-- Case Type: Negative
-- Test Focus: Release statement used as a concurrent signal assignment outside any process should fail
-- Expected Result: Triggers semantic error: release not allowed in concurrent context
-- Dependencies: None
-- =============================================================
entity simple_release_smn_001 is
end entity simple_release_smn_001;

architecture test of simple_release_smn_001 is
  signal s_bad : bit := '0';
begin
  s_bad <= release;          -- ERROR: release used concurrently outside process
end architecture test;
