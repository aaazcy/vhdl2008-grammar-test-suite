-- =============================================================
-- Case ID: TC_SIMPLE_CONFIGURATION_SPECIFICATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: simple_configuration_specification ::= for component_specification binding_indication [ ; ] end for [ ; ]
-- Case Type: Negative
-- Test Focus: orphaned "end for" missing the corresponding "for" — "end for;" appears in the architecture without the preceding configuration specification "for component_specification binding_indication", the syntax requires "end for" to appear only as the closing part of simple_configuration_specification paired with "for"
-- Expected Result: Triggers syntax error: unexpected "end for" without matching "for" configuration specification
-- Dependencies: None
-- =============================================================
entity scs_snn5_ent is
  port(a, b : in bit; y : out bit);
end entity scs_snn5_ent;

architecture rtl of scs_snn5_ent is
  component gate_or is
    port(x1, x2 : in bit; z : out bit);
  end component gate_or;
  -- ERROR: orphaned "end for" — no matching "for" config spec
  end for;
begin
  u_or : gate_or port map(x1 => a, x2 => b, z => y);
end architecture rtl;
