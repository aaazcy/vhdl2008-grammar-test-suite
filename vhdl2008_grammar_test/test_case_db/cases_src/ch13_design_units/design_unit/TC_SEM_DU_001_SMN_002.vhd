-- =============================================================
-- Case ID: TC_SEM_DU_001_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_DU_001
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Rule Description: the entity name declared by the secondary design unit architecture must refer to a primary design unit that has already been analyzed
-- Case Type: Negative
-- Error Category: unresolved entity
-- Test Focus: SMN: architecture declaration references an unanalyzed entity — missing_entity in architecture bad of missing_entity has no entity declaration and cannot be resolved during analysis
-- Expected Result: Triggers analysis error: entity "missing_entity" was not analysed
-- Dependencies: None
-- =============================================================
architecture bad of missing_entity is
begin
end architecture bad;
