-- =============================================================
-- Case ID: TC_ENTITY_ASPECT_SYN_006
-- Rule Type: Syntax
-- BNF Production: ENTITY_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: entity_aspect ::= entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name | open
-- Case Type: Positive
-- Test Focus: entity aspect used in a binding indication inside for-generate - verifying the configuration form of entity_aspect is equally legal in the block declarative region of a generate statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Supporting design units for the configuration referenced by the binding indication
entity gate_or is
  port(x1,x2 : in bit; z : out bit);
end entity gate_or;

architecture rtl of gate_or is
begin
end architecture rtl;

configuration or_gate_cfg of gate_or is
  for rtl
  end for;
end configuration or_gate_cfg;

entity easp_in_generate is
  port(a0,a1,b0,b1 : in bit; y0,y1 : out bit);
end entity;

architecture rtl of easp_in_generate is
  component gate_or is
    port(x1,x2 : in bit; z : out bit);
  end component;
begin
  gen_gates : for i in 0 to 1 generate
    signal a,b : bit;
  begin
    a <= a0 when i=0 else a1;
    b <= b0 when i=0 else b1;
    gen0 : if i = 0 generate
      for u : gate_or use configuration work.or_gate_cfg;
    begin
      u : gate_or port map(x1=>a, x2=>b, z=>y0);
    else generate
      for u : gate_or use configuration work.or_gate_cfg;
    begin
      u : gate_or port map(x1=>a, x2=>b, z=>y1);
    end generate;
  end generate;
end architecture rtl;
