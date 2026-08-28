-- =============================================================
-- Case ID: TC_COMPONENT_SPECIFICATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: component_specification ::= instantiation_list : component_name
-- Case Type: Positive
-- Test Focus: Combination of "all" and explicit single-label for different components — exercises the independent instantiation_list choices: "all:comp1" for gates of one type and "u_label:comp2" for a specific instance of another, within one architecture scope
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_inv is
  port (a : in bit; y : out bit);
end entity gate_inv;

architecture beh of gate_inv is
begin
end architecture beh;

entity gate_nor is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nor;

architecture rtl of gate_nor is
begin
end architecture rtl;

entity cs_mixed_instant is
  port(a,b,c,d,e : in bit; y1,y2,y3 : out bit);
end entity;

architecture bh of cs_mixed_instant is
  component gate_nor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  component gate_inv is
    port(a : in bit; y : out bit);
  end component;
  for all : gate_nor use entity work.gate_nor(rtl)
    port map(x1=>a, x2=>b, z=>y1);
  for u_inv1 : gate_inv use entity work.gate_inv(beh)
    port map(a=>e, y=>y3);
begin
  u_nor1 : gate_nor port map(x1=>a, x2=>b, z=>y1);
  u_nor2 : gate_nor port map(x1=>c, x2=>d, z=>y2);
  u_inv1 : gate_inv port map(a=>e, y=>y3);
end architecture bh;
