-- =============================================================
-- Case ID: TC_COMPONENT_SPECIFICATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: component_specification ::= instantiation_list : component_name
-- Case Type: Positive
-- Test Focus: Multiple different component types each with independent component_specification — exercises three distinct component declarations with separate "for label:comp" specifications, each mapping to a different entity/architecture pair, verifying that component_specification's component_name reference is resolved per-component
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

architecture rtl of gate_inv is
begin
end architecture rtl;

entity gate_or is
  port (x1,x2 : in bit; z : out bit);
end entity gate_or;

architecture beh of gate_or is
begin
end architecture beh;

entity cs_multi_comp is
  port(a,b,c : in bit; y1,y2,y3 : out bit);
end entity;

architecture bh of cs_multi_comp is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  component gate_or is
    port(x1,x2 : in bit; z : out bit);
  end component;
  component gate_inv is
    port(a : in bit; y : out bit);
  end component;
  for u_and : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y1);
  for u_or : gate_or use entity work.gate_or(beh)
    port map(x1=>a, x2=>b, z=>y2);
  for u_inv : gate_inv use entity work.gate_inv(rtl)
    port map(a=>c, y=>y3);
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y1);
  u_or : gate_or port map(x1=>a, x2=>b, z=>y2);
  u_inv : gate_inv port map(a=>c, y=>y3);
end architecture bh;
