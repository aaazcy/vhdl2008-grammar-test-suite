-- =============================================================
-- Case ID: TC_INSTANTIATED_UNIT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_INSTANTIATED_UNIT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: instantiated_unit ::= [ component ] component_name | entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name
-- Rule Description: The architecture specified in the entity instantiation must exist for the given entity; if absent, the default (most recently analyzed) architecture is used
-- Case Type: Positive
-- Test Focus: Omitting the architecture identifier to use the default architecture——`entity work.alu` does not specify an architecture, verifying the semantics of default binding to the most recently analyzed architecture
-- Expected Result: Compiles successfully; binds to the default architecture
-- Dependencies: None
-- =============================================================
entity iu_sem1_ent is
  port(a, b : in bit_vector(3 downto 0); y : out bit_vector(3 downto 0));
end entity iu_sem1_ent;

entity alu is
  port(x, y : in bit_vector(3 downto 0); z : out bit_vector(3 downto 0));
end entity alu;
architecture default_arch of alu is
begin
  z <= x xor y;
end architecture default_arch;

architecture struct of iu_sem1_ent is
begin
  u_alu : entity work.alu
    port map(x => a, y => b, z => y);
end architecture struct;
