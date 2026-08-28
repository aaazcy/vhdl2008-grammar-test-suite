-- =============================================================
-- Case ID: TC_COMPONENT_SPECIFICATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: component_specification ::= instantiation_list : component_name
-- Case Type: Positive
-- Test Focus: Component specification with multi-label comma-separated instantiation_list — exercises "{ instantiation_label , }" repetition, binding multiple instances of the same component in one configuration statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_nand is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nand;

architecture beh of gate_nand is
begin
end architecture beh;

entity cs_multi_label is
  port(a,b,c,d : in bit; y1,y2 : out bit);
end entity;

architecture bh of cs_multi_label is
  component gate_nand is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_nand1, u_nand2 : gate_nand use entity work.gate_nand(beh)
    port map(x1=>a, x2=>b, z=>y1);
begin
  u_nand1 : gate_nand port map(x1=>a, x2=>b, z=>y1);
  u_nand2 : gate_nand port map(x1=>c, x2=>d, z=>y2);
end architecture bh;
