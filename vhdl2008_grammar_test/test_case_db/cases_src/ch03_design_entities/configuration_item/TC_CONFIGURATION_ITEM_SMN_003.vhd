-- =============================================================
-- Case ID: TC_CONFIGURATION_ITEM_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONFIGURATION_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: configuration_item ::= block_configuration | component_configuration
-- Case Type: Negative
-- Test Focus: Nonexistent port name in port map of component_configuration in configuration_item: the port map references a port name not declared in the component interface, verifying port mapping names must exist among the component ports
-- Expected Result: Triggers semantic error on non-existent port name in port map
-- Dependencies: None
-- =============================================================
entity and2 is
  port (x1,x2:in bit; z:out bit);
end entity and2;

architecture rtl of and2 is
begin
end architecture rtl;

entity ci_smn3_ent is
  port(a,b:in bit; y:out bit);
end entity;
architecture rtl of ci_smn3_ent is
  component and2 is port(x1,x2:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_and:and2 port map(x1=>a,x2=>b,z=>s); y<=s;
end architecture;
configuration ci_smn3_cfg of ci_smn3_ent is
  for rtl
    for u_and:and2 use entity work.and2(rtl)
      port map(x1=>a, x2=>b, no_such_port=>s);
  end for;
end configuration ci_smn3_cfg;
