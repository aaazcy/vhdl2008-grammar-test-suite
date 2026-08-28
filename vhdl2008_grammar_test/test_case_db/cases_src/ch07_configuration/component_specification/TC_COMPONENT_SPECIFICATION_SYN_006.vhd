-- =============================================================
-- Case ID: TC_COMPONENT_SPECIFICATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: component_specification ::= instantiation_list : component_name
-- Case Type: Positive
-- Test Focus: Comma-separated multi-label instantiation_list with three labels — exercises the full repetition "{ instantiation_label , }" by binding three distinct instances with one component_specification statement, more labels than the minimum two
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_nand is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nand;

architecture rtl of gate_nand is
begin
end architecture rtl;

entity cs_triple_label is
  port(a,b,c,d,e,f : in bit; y1,y2,y3 : out bit);
end entity;

architecture bh of cs_triple_label is
  component gate_nand is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_nand1, u_nand2, u_nand3 : gate_nand use entity work.gate_nand(rtl)
    port map(x1=>a, x2=>b, z=>y1);
  signal s_x : bit := '0';
begin
  u_nand1 : gate_nand port map(x1=>a, x2=>b, z=>y1);
  u_nand2 : gate_nand port map(x1=>c, x2=>d, z=>y2);
  u_nand3 : gate_nand port map(x1=>e, x2=>f, z=>y3);
end architecture bh;
