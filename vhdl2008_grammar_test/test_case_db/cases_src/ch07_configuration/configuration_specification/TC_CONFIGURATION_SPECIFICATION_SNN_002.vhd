-- =============================================================
-- Case ID: TC_CONFIGURATION_SPECIFICATION_SNN_002
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: configuration_specification ::= simple_configuration_specification | compound_configuration_specification
-- Case Type: Negative
-- Test Focus: SNN: component_specification of configuration_specification referencing an undeclared component name (nonexistent_comp) - the instantiation_list in component_specification must reference a declared component
-- Expected Result: Triggers syntax error (incomplete configuration specification)
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity confspec_no_end is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of confspec_no_end is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  -- ERROR: component_specification references an undeclared component
  for u_and : nonexistent_comp use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y);
  end for;
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y);
end architecture bh;
