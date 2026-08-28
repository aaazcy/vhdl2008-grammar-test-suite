-- =============================================================
-- Case ID: TC_CONFIGURATION_SPECIFICATION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: configuration_specification ::= simple_configuration_specification | compound_configuration_specification
-- Case Type: Negative (Semantic)
-- Test Focus: Simple form entity/component port mismatch — the simple_configuration_specification binds a component to an entity whose port list signature differs from the component's port declaration; the ports must be compatible across the binding
-- Expected Result: Triggers semantic error (port signature mismatch)
-- Dependencies: None
-- =============================================================
entity confspec_smn1_ent is
  port(a : in bit; y : out bit);
end entity;

architecture bh of confspec_smn1_ent is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  -- ERROR: component has 3 ports (x1,x2,z) but entity has 2 (a,y)
  for u_and : gate_and use entity work.confspec_smn1_ent(bh)
    port map(x1=>a, x2=>a, z=>y);
  end for;
  signal s_a : bit := '0';
begin
  u_and : gate_and port map(x1=>s_a, x2=>s_a, z=>y);
end architecture bh;
