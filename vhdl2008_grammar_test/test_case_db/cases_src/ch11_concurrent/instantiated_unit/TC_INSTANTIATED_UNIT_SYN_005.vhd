-- =============================================================
-- Case ID: TC_INSTANTIATED_UNIT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_INSTANTIATED_UNIT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: instantiated_unit ::= [ component ] component_name | entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name
-- Case Type: Positive
-- Test Focus: Multiple instantiated_unit forms coexisting——the same architecture uses three forms: the entity form, the entity form with an arch identifier and the configuration form, verifying that different instantiated_unit syntaxes can coexist in one design
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity iu_multi_ent is
  port(a, b : in bit; y_and, y_or : out bit);
end entity iu_multi_ent;

entity and2 is port(x, y : in bit; z : out bit); end entity and2;
architecture dataflow of and2 is begin z <= x and y; end architecture dataflow;

entity or2 is port(x, y : in bit; z : out bit); end entity or2;
architecture rtl of or2 is begin z <= x or y; end architecture rtl;

architecture struct of iu_multi_ent is
begin
  u_and : entity work.and2
    port map(x => a, y => b, z => y_and);
  u_or : entity work.or2(rtl)
    port map(x => a, y => b, z => y_or);
end architecture struct;
