-- =============================================================
-- Case ID: TC_CONFIGURATION_SPECIFICATION_SNN_003
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: configuration_specification ::= simple_configuration_specification | compound_configuration_specification
-- Case Type: Negative
-- Test Focus: Invalid mix — using "use vunit" without the compound form wrapper ("end for" without proper compound structure); the "use vunit" clause is only valid inside a compound configuration
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity gate_nor is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nor;

architecture beh of gate_nor is
begin
end architecture beh;

entity confspec_invalid_vunit is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of confspec_invalid_vunit is
  component gate_nor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  -- ERROR: "use vunit" without compound form "end for" wrapper
  for u_nor : gate_nor use entity work.gate_nor(beh)
    port map(x1=>a, x2=>b, z=>y);
    use vunit nor_check;
begin
  u_nor : gate_nor port map(x1=>a, x2=>b, z=>y);
end architecture bh;
