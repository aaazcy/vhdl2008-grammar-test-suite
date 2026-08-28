-- =============================================================
-- Case ID: TC_SIMPLE_CONFIGURATION_SPECIFICATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: simple_configuration_specification ::= for component_specification binding_indication [ ; ] end for [ ; ]
-- Case Type: Negative
-- Test Focus: missing component_specification — the "for" keyword is directly followed by the "use entity" of binding_indication, no component specification with instantiation_label : component_name is given, the syntax requires component_specification to appear right after "for" before binding_indication
-- Expected Result: Triggers syntax error: expected component_specification after "for"
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1, x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity scs_snn1_ent is
  port(a, b : in bit; y : out bit);
end entity scs_snn1_ent;

architecture rtl of scs_snn1_ent is
  component gate_and is
    port(x1, x2 : in bit; z : out bit);
  end component gate_and;
  -- ERROR: missing component_specification — "for" followed directly by binding
  for use entity work.gate_and(rtl)
    port map(x1 => a, x2 => b, z => y);
  end for;
begin
  u_and : gate_and port map(x1 => a, x2 => b, z => y);
end architecture rtl;
