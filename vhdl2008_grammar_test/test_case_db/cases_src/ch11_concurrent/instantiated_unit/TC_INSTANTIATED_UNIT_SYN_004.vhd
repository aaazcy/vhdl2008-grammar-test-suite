-- =============================================================
-- Case ID: TC_INSTANTIATED_UNIT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_INSTANTIATED_UNIT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: instantiated_unit ::= [ component ] component_name | entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name
-- Case Type: Positive
-- Test Focus: configuration form——`configuration work.my_cfg` uses a configuration name as the instantiated_unit, verifying the third form, the configuration reference
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity iu_cfg_ent is
  port(a, b : in bit; y : out bit);
end entity iu_cfg_ent;

entity or2 is port(x, y : in bit; z : out bit); end entity or2;
architecture dataflow of or2 is begin z <= x or y; end architecture dataflow;

architecture bh of iu_cfg_ent is
begin
  y <= a or b;
end architecture bh;

configuration my_cfg of iu_cfg_ent is
  for bh
  end for;
end configuration my_cfg;

architecture bh2 of iu_cfg_ent is
begin
  u_cfg : configuration work.my_cfg port map(a => a, b => b, y => y);
end architecture bh2;
