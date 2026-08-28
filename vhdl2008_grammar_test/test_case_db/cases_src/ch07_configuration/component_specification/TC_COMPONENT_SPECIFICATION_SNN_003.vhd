-- =============================================================
-- Case ID: TC_COMPONENT_SPECIFICATION_SNN_003
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_COMPONENT_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: component_specification ::= instantiation_list : component_name
-- Case Type: Negative
-- Test Focus: Using undeclared component_name in component_specification — "for all : gate_unknown" references a component that was never declared, violating the requirement that component_name must denote a visible component
-- Expected Result: Triggers semantic error (undeclared component)
-- Dependencies: None
-- =============================================================
entity gate_nor is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nor;

architecture rtl of gate_nor is
begin
end architecture rtl;

entity cs_unknown_component is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of cs_unknown_component is
  component gate_nor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  -- ERROR: gate_unknown is not a declared component
  for u_nor1 : gate_unknown use entity work.gate_nor(rtl)
    port map(x1=>a, x2=>b, z=>y);
begin
  u_nor1 : gate_nor port map(x1=>a, x2=>b, z=>y);
end architecture bh;
