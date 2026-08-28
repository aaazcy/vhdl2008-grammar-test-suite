-- =============================================================
-- Case ID: TC_SIMPLE_CONFIGURATION_SPECIFICATION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_SIMPLE_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: simple_configuration_specification ::= for component_specification binding_indication [ ; ] end for [ ; ]
-- Case Type: Negative
-- Test Focus: component_specification references an undeclared component name — the component_name part of the configuration specification uses "imaginary_gate", which is not declared as a component in the declarative region of the architecture, semantically referencing a non-existent component type
-- Expected Result: Triggers semantic error: component "imaginary_gate" not declared
-- Dependencies: None
-- =============================================================
entity gate_xor is
  port (x1, x2 : in bit; z : out bit);
end entity gate_xor;

architecture rtl of gate_xor is
begin
end architecture rtl;

entity scs_sem2_ent is
  port(a, b : in bit; y : out bit);
end entity scs_sem2_ent;

architecture rtl of scs_sem2_ent is
  component gate_xor is
    port(x1, x2 : in bit; z : out bit);
  end component gate_xor;
  -- ERROR: "imaginary_gate" is not a declared component
  for u_imag : imaginary_gate use entity work.gate_xor(rtl)
    port map(x1 => a, x2 => b, z => y);
  end for;
begin
  u_imag : gate_xor port map(x1 => a, x2 => b, z => y);
end architecture rtl;
