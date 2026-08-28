-- =============================================================
-- Case ID: TC_SIMPLE_CONFIGURATION_SPECIFICATION_SNN_004
-- Rule Type: Syntax
-- BNF Production: SIMPLE_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: simple_configuration_specification ::= for component_specification binding_indication [ ; ] end for [ ; ]
-- Case Type: Negative
-- Test Focus: Missing "use" keyword in binding_indication — the configuration specification has "for" and a component_specification but the binding_indication lacks the required "use entity_aspect" / "use configuration" / "use open" clause
-- Expected Result: Triggers syntax error: missing binding_indication
-- Dependencies: None
-- =============================================================
entity scs_snn4_ent is
  port(a, b : in bit; y : out bit);
end entity scs_snn4_ent;

architecture bh of scs_snn4_ent is
  component gate_xor is
    port(x1, x2 : in bit; z : out bit);
  end component gate_xor;
  -- ERROR: missing "use" binding_indication — only for+component_spec, no binding
  for u_gate : gate_xor;
  end for;
begin
  u_gate : gate_xor port map(x1 => a, x2 => b, z => y);
end architecture bh;
