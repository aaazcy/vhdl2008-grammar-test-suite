-- =============================================================
-- Case ID: TC_INSTANTIATED_UNIT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_INSTANTIATED_UNIT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: instantiated_unit ::= [ component ] component_name | entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name
-- Case Type: Negative
-- Test Focus: SNN: unclosed parentheses of the architecture identifier——`entity work.dff(behavioral` lacks the right parenthesis, verifying that the parentheses of the architecture_identifier must be paired
-- Expected Result: Triggers syntax error: missing closing ")" for architecture identifier
-- Dependencies: None
-- =============================================================
entity iu_snn4_ent is
  port(clk, d : in bit; q : out bit);
end entity iu_snn4_ent;
architecture struct of iu_snn4_ent is
begin
  u_err : entity work.dff(behavioral
    port map(clk => clk, d => d, q => q);
end architecture struct;
