-- =============================================================
-- Case ID: TC_INSTANTIATED_UNIT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_INSTANTIATED_UNIT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: instantiated_unit ::= [ component ] component_name | entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name
-- Rule Description: The specified architecture identifier must name an existing architecture of the entity; referencing a non-existent architecture causes an elaboration error
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SMN: architecture identifier referencing a nonexistent architecture——`entity work.alu(nonexistent)` specifies a nonexistent architecture name, verifying that the architecture binding fails at elaboration time
-- Expected Result: Triggers elaboration error: architecture "nonexistent" not found for entity
-- Dependencies: None
-- =============================================================
entity iu_smn1_ent is
  port(a, b : in bit_vector(3 downto 0); y : out bit_vector(3 downto 0));
end entity iu_smn1_ent;
architecture struct of iu_smn1_ent is
begin
  u_err : entity work.alu(nonexistent)
    port map(x => a, y => b, z => y);
end architecture struct;
