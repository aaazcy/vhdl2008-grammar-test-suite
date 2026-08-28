-- =============================================================
-- Case ID: TC_ENTITY_ASPECT_SYN_002
-- Rule Type: Syntax
-- BNF Production: ENTITY_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: entity_aspect ::= entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name | open
-- Case Type: Positive
-- Test Focus: Entity aspect "configuration" alternative — exercises "use configuration config_name" form, binding a component to a declared configuration instead of an entity
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Supporting design units for the configuration referenced by the binding indication
entity gate_nand is
  port(x1,x2 : in bit; z : out bit);
end entity gate_nand;

architecture rtl of gate_nand is
begin
end architecture rtl;

configuration gate_nand_cfg of gate_nand is
  for rtl
  end for;
end configuration gate_nand_cfg;

entity easp_config_form is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of easp_config_form is
  component gate_nand is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_nand : gate_nand use configuration work.gate_nand_cfg
    port map(x1=>a, x2=>b, z=>y);
begin
  u_nand : gate_nand port map(x1=>a, x2=>b, z=>y);
end architecture bh;
