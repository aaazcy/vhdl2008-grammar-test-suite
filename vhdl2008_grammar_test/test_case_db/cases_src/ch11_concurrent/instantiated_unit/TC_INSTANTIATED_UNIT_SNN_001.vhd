-- =============================================================
-- Case ID: TC_INSTANTIATED_UNIT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INSTANTIATED_UNIT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: instantiated_unit ::= [ component ] component_name | entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name
-- Case Type: Negative
-- Test Focus: SNN: entity form missing the entity_name——`entity work.` has no entity name after it, verifying that a legal entity_name must follow the entity keyword
-- Expected Result: Triggers syntax error: missing entity name in instantiated_unit
-- Dependencies: None
-- =============================================================
entity iu_snn1_ent is
  port(a, b : in bit; y : out bit);
end entity iu_snn1_ent;
architecture struct of iu_snn1_ent is
begin
  u_err : entity work. port map(x => a, y => b, z => y);
end architecture struct;
