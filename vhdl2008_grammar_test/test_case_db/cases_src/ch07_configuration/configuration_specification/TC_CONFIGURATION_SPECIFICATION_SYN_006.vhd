-- =============================================================
-- Case ID: TC_CONFIGURATION_SPECIFICATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: configuration_specification ::= simple_configuration_specification | compound_configuration_specification
-- Case Type: Positive
-- Test Focus: Simple configuration_specification with "all" instantiation_list — exercises the simple form alternative with the "all" keyword, binding every instance of a component to the same entity in one configuration statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_nor is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nor;

architecture rtl of gate_nor is
begin
end architecture rtl;

entity confspec_simple_all is
  port(a,b,c,d : in bit; y1,y2 : out bit);
end entity;

architecture bh of confspec_simple_all is
  component gate_nor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for all : gate_nor use entity work.gate_nor(rtl)
    port map(x1=>a, x2=>b, z=>y1);
  end for;
begin
  u_nor1 : gate_nor port map(x1=>a, x2=>b, z=>y1);
  u_nor2 : gate_nor port map(x1=>c, x2=>d, z=>y2);
end architecture bh;
