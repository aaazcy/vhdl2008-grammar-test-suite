-- =============================================================
-- Case ID: TC_CONFIGURATION_ITEM_SNN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: configuration_item ::= block_configuration | component_configuration
-- Case Type: Negative
-- Test Focus: component_specification in component_configuration of configuration_item missing the instance label: in for :comp_name there is no instance label before the colon, verifying instantiation_label is a mandatory component of component_specification
-- Expected Result: Triggers syntax error on missing instantiation label in component specification
-- Dependencies: None
-- =============================================================
entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity ci_snn7_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of ci_snn7_ent is
  component inv is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture;
configuration ci_snn7_cfg of ci_snn7_ent is
  for rtl
    for :inv use entity work.inv(rtl);
  end for;
end configuration ci_snn7_cfg;
