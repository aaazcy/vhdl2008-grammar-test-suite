-- =============================================================
-- Case ID: TC_CONFIGURATION_SPECIFICATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: configuration_specification ::= simple_configuration_specification | compound_configuration_specification
-- Case Type: Positive
-- Test Focus: Configuration specification using simple form — exercises the simple_configuration_specification alternative: "for ... use ... end for ;" with full entity aspect and port map
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity confspec_simple is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of confspec_simple is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_and : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y);
  end for;
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y);
end architecture bh;
