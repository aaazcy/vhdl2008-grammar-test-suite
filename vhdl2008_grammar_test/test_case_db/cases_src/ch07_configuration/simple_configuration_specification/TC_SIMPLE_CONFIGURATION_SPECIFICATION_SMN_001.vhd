-- =============================================================
-- Case ID: TC_SIMPLE_CONFIGURATION_SPECIFICATION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_SIMPLE_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: simple_configuration_specification ::= for component_specification binding_indication [ ; ] end for [ ; ]
-- Case Type: Negative
-- Test Focus: the component port count in binding_indication mismatches the bound entity port count — the port map association in the configuration specification uses a gate component with 2 ports to bind an entity with 3 ports, semantically producing a port count mismatch error
-- Expected Result: Triggers semantic error: port count mismatch — component has 2 formal ports but bound entity has 3 ports
-- Dependencies: None
-- =============================================================
entity scs_smn1_ent is
  port(a, b, c : in bit; y : out bit);
end entity scs_smn1_ent;

architecture rtl of scs_smn1_ent is
  component gate_and2 is
    port(x1, x2 : in bit; z : out bit);
  end component gate_and2;
  -- ERROR: gate_and2 has 2 input ports, but and3_entity expects 3 inputs
  for u_and : gate_and2 use entity work.and3_entity(rtl)
    port map(x1 => a, x2 => b, z => y);
  end for;
begin
  u_and : gate_and2 port map(x1 => a, x2 => b, z => y);
end architecture rtl;
