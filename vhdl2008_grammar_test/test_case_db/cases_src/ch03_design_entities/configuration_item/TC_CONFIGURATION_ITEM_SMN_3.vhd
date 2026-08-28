-- =============================================================
-- Case ID: TC_CONFIGURATION_ITEM_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONFIGURATION_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: configuration_item ::= block_configuration | component_configuration
-- Case Type: Negative
-- Test Focus: Component name mismatch in component_configuration of configuration_item: in for label:wrong_comp the component name differs from the component actually used in the instance, verifying the component name in a configuration item must match the instantiated component declaration
-- Expected Result: Triggers semantic error on component name mismatch
-- Dependencies: None
-- =============================================================
entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity ci_sem2_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of ci_sem2_ent is
  component inv is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture;
configuration ci_sem2_cfg of ci_sem2_ent is
  for rtl
    for u_inv:and2 use entity work.inv(rtl);
  end for;
end configuration ci_sem2_cfg;
