-- =============================================================
-- Case ID: TC_INSTANTIATED_UNIT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INSTANTIATED_UNIT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: instantiated_unit ::= [ component ] component_name | entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name
-- Case Type: Positive
-- Test Focus: entity form with an architecture identifier——`entity work.dff(behavioral)` explicitly specifies the architecture behavioral, verifying that the entity form of instantiated_unit can bind a specific architecture
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity iu_entity_arch_ent is
  port(clk, d : in bit; q : out bit);
end entity iu_entity_arch_ent;

entity dff is
  port(clk, d : in bit; q : out bit);
end entity dff;
architecture behavioral of dff is
begin
  process(clk) is
  begin
    if clk'event and clk = '1' then q <= d; end if;
  end process;
end architecture behavioral;

architecture struct of iu_entity_arch_ent is
begin
  u_ff : entity work.dff(behavioral)
    port map(clk => clk, d => d, q => q);
end architecture struct;
