-- =============================================================
-- Case ID: TC_COMPONENT_SPECIFICATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: component_specification ::= instantiation_list : component_name
-- Case Type: Positive
-- Test Focus: Component specification with "all" keyword in instantiation_list — exercises the "all" alternative of instantiation_list, binding every instance of named component
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_or is
  port (x1,x2 : in bit; z : out bit);
end entity gate_or;

architecture rtl of gate_or is
begin
end architecture rtl;

entity cs_all_instances is
  port(a,b,c,d : in bit; y1,y2 : out bit);
end entity;

architecture bh of cs_all_instances is
  component gate_or is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for all : gate_or use entity work.gate_or(rtl)
    port map(x1=>a, x2=>b, z=>y1);
begin
  u_or1 : gate_or port map(x1=>a, x2=>b, z=>y1);
  u_or2 : gate_or port map(x1=>c, x2=>d, z=>y2);
end architecture bh;
