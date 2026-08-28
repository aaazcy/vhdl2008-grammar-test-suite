-- =============================================================
-- Case ID: TC_COMPONENT_SPECIFICATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: component_specification ::= instantiation_list : component_name
-- Case Type: Positive
-- Test Focus: Component specification with "others" keyword — exercises the "others" alternative; binds all unbound instances, combined with explicit multi-label binding for contrast
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_xor is
  port (x1,x2 : in bit; z : out bit);
end entity gate_xor;

architecture beh of gate_xor is
begin
end architecture beh;

entity cs_others_instances is
  port(a,b,c,d,e,f : in bit; y1,y2,y3 : out bit);
end entity;

architecture bh of cs_others_instances is
  component gate_xor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_xor1 : gate_xor use entity work.gate_xor(rtl)
    port map(x1=>a, x2=>b, z=>y1);
  for others : gate_xor use entity work.gate_xor(beh)
    port map(x1=>a, x2=>b, z=>y1);
begin
  u_xor1 : gate_xor port map(x1=>a, x2=>b, z=>y1);
  u_xor2 : gate_xor port map(x1=>c, x2=>d, z=>y2);
  u_xor3 : gate_xor port map(x1=>e, x2=>f, z=>y3);
end architecture bh;
