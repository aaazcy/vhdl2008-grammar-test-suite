-- =============================================================
-- Case ID: TC_CONFIGURATION_SPECIFICATION_SYN_004
-- Rule Type: Syntax
-- BNF Production: CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: configuration_specification ::= simple_configuration_specification | compound_configuration_specification
-- Case Type: Positive
-- Test Focus: Simple configuration with "others" and no explicit binding — exercises the simple form with "others" instantiation_list and open entity_aspect, testing the minimal simple_configuration_specification syntax
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity confspec_simple_min is
  port(a,b,c,d : in bit; y1,y2 : out bit);
end entity;

architecture bh of confspec_simple_min is
  component gate_xor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for others : gate_xor use open;
  end for;
begin
  u_xor1 : gate_xor port map(x1=>a, x2=>b, z=>y1);
  u_xor2 : gate_xor port map(x1=>c, x2=>d, z=>y2);
end architecture bh;
