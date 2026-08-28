-- =============================================================
-- Case ID: TC_CONFIGURATION_ITEM_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONFIGURATION_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: configuration_item ::= block_configuration | component_configuration
-- Case Type: Negative
-- Test Focus: Duplicate binding of the same instance in configuration_item: two component_configurations give different bindings for the same instance label, verifying each instance is configured at most once
-- Expected Result: Triggers semantic error on duplicate configuration for same instance
-- Dependencies: None
-- =============================================================
entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture beh of inv is
begin
end architecture beh;

entity ci_smn1_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of ci_smn1_ent is
  component inv is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture;
configuration ci_smn1_cfg of ci_smn1_ent is
  for rtl
    for u_inv:inv use entity work.inv(rtl);
    for u_inv:inv use entity work.inv(beh);
  end for;
end configuration ci_smn1_cfg;
