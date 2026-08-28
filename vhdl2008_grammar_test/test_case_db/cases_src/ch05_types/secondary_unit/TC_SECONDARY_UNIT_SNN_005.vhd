-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SECONDARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit ::= architecture_body | package_body
-- Case Type: Negative
-- Test Focus: ERROR: architecture body without a corresponding entity
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
-- ERROR: architecture body without a corresponding entity
architecture orphan of nosu_entity is  -- ERROR: no entity named nosu_entity
begin end architecture;