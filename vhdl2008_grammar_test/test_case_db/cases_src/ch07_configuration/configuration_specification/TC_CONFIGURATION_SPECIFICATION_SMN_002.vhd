-- =============================================================
-- Case ID: TC_CONFIGURATION_SPECIFICATION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: configuration_specification ::= simple_configuration_specification | compound_configuration_specification
-- Case Type: Negative (Semantic)
-- Test Focus: Double-binding conflict — two configuration specifications target the same instance label, creating an ambiguity about which binding applies to the instantiated component
-- Expected Result: Triggers semantic error (duplicate configuration specification for same instance)
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture beh of gate_and is
begin
end architecture beh;

entity confspec_smn2_ent is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of confspec_smn2_ent is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  -- ERROR: two configuration specs for the same label 'u_and'
  for u_and : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y);
  end for;
  for u_and : gate_and use entity work.gate_and(beh)
    port map(x1=>a, x2=>b, z=>y);
  end for;
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y);
end architecture bh;
