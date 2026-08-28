-- =============================================================
-- Case ID: TC_FORMAL_DESIGNATOR_SYN_001
-- Rule Type: Syntax
-- BNF Production: FORMAL_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: formal_designator ::= generic_name | port_name | parameter_name
-- Test Focus: formal_designator as port_name — simple port map with formal=>actual
--   binding in component instantiation. Verifies that a port name identifier
--   can appear as the formal_designator on the left side of an association.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

-- Component: dual-input AND gate
entity and_gate is
  port (
    a : in  bit;
    b : in  bit;
    y : out bit
  );
end entity and_gate;

architecture rtl of and_gate is
begin
  y <= a and b;
end architecture rtl;

-- Top-level: instantiates and_gate with named port map associations
entity formal_designator_top is
  port (
    input_a  : in  bit;
    input_b  : in  bit;
    output_y : out bit
  );
end entity formal_designator_top;

architecture struct of formal_designator_top is
  -- Component declaration matching the AND gate
  component and_gate is
    port (
      a : in  bit;
      b : in  bit;
      y : out bit
    );
  end component and_gate;

  signal s_result : bit;
begin
  -- Port map where each formal_designator is a port_name:
  --   a, b, y are all port_name formal_designators
  u_and : and_gate
    port map (
      a => input_a,
      b => input_b,
      y => s_result
    );

  output_y <= s_result;
end architecture struct;
