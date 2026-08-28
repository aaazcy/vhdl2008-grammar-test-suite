-- =============================================================
-- Case ID: TC_ENTITY_ASPECT_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: entity_aspect ::= entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name | open
-- Test Focus: Entity aspect production-specific: all three alternatives demonstrated — "entity work.xxx(arch)", "configuration work.cfg", and "open" all used in binding_indication context
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_nor is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nor;

architecture rtl of gate_nor is
begin
end architecture rtl;

-- Supporting design units for the configuration referenced by the binding indication
entity gate_and is
  port(x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

configuration and_gate_cfg of gate_and is
  for rtl
  end for;
end configuration and_gate_cfg;

entity easp_prod_specific is
  port(a,b,c,d,e,f : in bit; y1,y2,y3 : out bit);
end entity;

architecture bh of easp_prod_specific is
  component gate_nor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  component gate_nand is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_nor : gate_nor use entity work.gate_nor(rtl)
    port map(x1=>a, x2=>b, z=>y1);
  for u_and : gate_and use configuration work.and_gate_cfg
    port map(x1=>c, x2=>d, z=>y2);
  for u_nand : gate_nand use open;
begin
  u_nor : gate_nor port map(x1=>a, x2=>b, z=>y1);
  u_and : gate_and port map(x1=>c, x2=>d, z=>y2);
  u_nand : gate_nand port map(x1=>e, x2=>f, z=>y3);
end architecture bh;
