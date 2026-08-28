-- =============================================================
-- Case ID: TC_SIMPLE_CONFIGURATION_SPECIFICATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: simple_configuration_specification ::= for component_specification binding_indication [ ; ] end for [ ; ]
-- Case Type: Positive
-- Test Focus: using the "use configuration" binding form — in the simple configuration specification the binding_indication uses "use configuration" to reference an already declared configuration instead of "use entity", verifies the configuration variant of binding_indication is accepted syntactically, with end for and semicolon at the end
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and is
  port(x1, x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

configuration and_gate_cfg of gate_and is
  for rtl
  end for;
end configuration and_gate_cfg;

entity scs_syn5_ent is
  port(a, b : in bit; y : out bit);
end entity scs_syn5_ent;

architecture rtl of scs_syn5_ent is
  component gate_and is
    port(x1, x2 : in bit; z : out bit);
  end component gate_and;
  for u_and : gate_and use configuration work.and_gate_cfg;
  end for;
begin
  u_and : gate_and port map(x1 => a, x2 => b, z => y);
end architecture rtl;
