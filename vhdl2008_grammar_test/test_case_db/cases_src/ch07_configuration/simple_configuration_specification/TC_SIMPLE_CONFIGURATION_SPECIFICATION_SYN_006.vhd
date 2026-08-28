-- =============================================================
-- Case ID: TC_SIMPLE_CONFIGURATION_SPECIFICATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: simple_configuration_specification ::= for component_specification binding_indication [ ; ] end for [ ; ]
-- Case Type: Positive
-- Test Focus: using the "use open" binding form — in the simple configuration specification the binding_indication uses "use open" to keep the component unbound, verifies the open variant of binding_indication is accepted syntactically, allowing the component to be bound in a later configuration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity scs_syn6_ent is
  port(a, b : in bit; y : out bit);
end entity scs_syn6_ent;

architecture rtl of scs_syn6_ent is
  component gate_nor is
    port(x1, x2 : in bit; z : out bit);
  end component gate_nor;
  for u_nor : gate_nor use open;
  end for;
begin
  u_nor : gate_nor port map(x1 => a, x2 => b, z => y);
end architecture rtl;
