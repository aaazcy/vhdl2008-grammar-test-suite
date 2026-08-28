-- =============================================================
-- Case ID: TC_SIMPLE_CONFIGURATION_SPECIFICATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: simple_configuration_specification ::= for component_specification binding_indication [ ; ] end for [ ; ]
-- Case Type: Negative
-- Test Focus: Missing colon separator in component_specification — the instantiation_label and component_name are not separated by a colon, making the component_specification unparseable
-- Expected Result: Triggers syntax error: expected ":" in component_specification
-- Dependencies: None
-- =============================================================
entity gate_nand is
  port (x1, x2 : in bit; z : out bit);
end entity gate_nand;

architecture rtl of gate_nand is
begin
end architecture rtl;

entity scs_snn3_ent is
  port(a, b : in bit; y : out bit);
end entity scs_snn3_ent;

architecture bh of scs_snn3_ent is
  component gate_nand is
    port(x1, x2 : in bit; z : out bit);
  end component gate_nand;
  -- ERROR: missing colon between instantiation_label and component_name
  for u_gate gate_nand use entity work.gate_nand(rtl)
    port map(x1 => a, x2 => b, z => y);
  end for;
begin
  u_gate : gate_nand port map(x1 => a, x2 => b, z => y);
end architecture bh;
