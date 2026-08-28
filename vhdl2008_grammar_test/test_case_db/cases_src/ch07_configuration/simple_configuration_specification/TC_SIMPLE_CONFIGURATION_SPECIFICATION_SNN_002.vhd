-- =============================================================
-- Case ID: TC_SIMPLE_CONFIGURATION_SPECIFICATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: simple_configuration_specification ::= for component_specification binding_indication [ ; ] end for [ ; ]
-- Case Type: Negative
-- Test Focus: Missing "for" keyword — the configuration specification begins directly with the instantiation label without the required leading "for" token, violating the production structure
-- Expected Result: Triggers syntax error: missing "for" keyword
-- Dependencies: None
-- =============================================================
entity gate_or is
  port (x1, x2 : in bit; z : out bit);
end entity gate_or;

architecture rtl of gate_or is
begin
end architecture rtl;

entity scs_snn2_ent is
  port(a, b : in bit; y : out bit);
end entity scs_snn2_ent;

architecture bh of scs_snn2_ent is
  component gate_or is
    port(x1, x2 : in bit; z : out bit);
  end component gate_or;
  -- ERROR: missing "for" keyword before component_specification
  u_gate : gate_or use entity work.gate_or(rtl)
    port map(x1 => a, x2 => b, z => y);
  end for;
begin
  u_gate : gate_or port map(x1 => a, x2 => b, z => y);
end architecture bh;
