-- =============================================================
-- Case ID: TC_ENTITY_ASPECT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: entity_aspect ::= entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name | open
-- Case Type: Positive
-- Test Focus: Different entity_aspect forms mixed for different components in the same architecture - the first uses entity+arch, the second uses configuration, the third uses open, verifying the parser supports all three forms in the same context
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
entity gate_xor is
  port(x1,x2 : in bit; z : out bit);
end entity gate_xor;

architecture rtl of gate_xor is
begin
end architecture rtl;

configuration xor_gate_cfg of gate_xor is
  for rtl
  end for;
end configuration xor_gate_cfg;

entity easp_mixed_forms is
  port(a,b,c,d,e,f : in bit; y1,y2,y3 : out bit);
end entity;

architecture rtl of easp_mixed_forms is
  component gate_nor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  component gate_xor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  component gate_nand is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_nor  : gate_nor  use entity work.gate_nor(rtl)
    port map(x1=>a, x2=>b, z=>y1);
  for u_xor  : gate_xor  use configuration work.xor_gate_cfg
    port map(x1=>c, x2=>d, z=>y2);
  for u_nand : gate_nand use open;
begin
  u_nor  : gate_nor  port map(x1=>a, x2=>b, z=>y1);
  u_xor  : gate_xor  port map(x1=>c, x2=>d, z=>y2);
  u_nand : gate_nand port map(x1=>e, x2=>f, z=>y3);
end architecture rtl;
