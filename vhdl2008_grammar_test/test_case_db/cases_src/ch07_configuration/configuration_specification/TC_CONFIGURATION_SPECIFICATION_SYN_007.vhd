-- =============================================================
-- Case ID: TC_CONFIGURATION_SPECIFICATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: configuration_specification ::= simple_configuration_specification | compound_configuration_specification
-- Case Type: Positive
-- Test Focus: Multiple simple_configuration_specifications for three different components — exercises the repetition of independent simple form "for...use...end for;" blocks, one per component type, each with different entity_aspect variations (entity, open, configuration)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity gate_inv is
  port (a : in bit; y : out bit);
end entity gate_inv;

architecture beh of gate_inv is
begin
end architecture beh;

entity confspec_triple_simple is
  port(a,b,c : in bit; y1,y2,y3 : out bit);
end entity;

architecture bh of confspec_triple_simple is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  component gate_xor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  component gate_inv is
    port(a : in bit; y : out bit);
  end component;
  for u_and : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y1);
  end for;
  for u_xor : gate_xor use open;
  end for;
  for u_inv : gate_inv use entity work.gate_inv(beh)
    port map(a=>c, y=>y3);
  end for;
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y1);
  u_xor : gate_xor port map(x1=>a, x2=>b, z=>y2);
  u_inv : gate_inv port map(a=>c, y=>y3);
end architecture bh;
