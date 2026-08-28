-- =============================================================
-- Case ID: TC_SIMPLE_CONFIGURATION_SPECIFICATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: simple_configuration_specification ::= for component_specification binding_indication [ ; ] end for [ ; ]
-- Case Type: Positive
-- Test Focus: Minimal simple config spec — single instance, entity binding with port map, no trailing semicolons, no end for clause
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1, x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity scs_syn1_ent is
  port(a, b : in bit; y : out bit);
end entity scs_syn1_ent;

architecture rtl of scs_syn1_ent is
  component gate_and is
    port(x1, x2 : in bit; z : out bit);
  end component gate_and;
  for u_gate : gate_and use entity work.gate_and(rtl)
    port map(x1 => a, x2 => b, z => y);
begin
  u_gate : gate_and port map(x1 => a, x2 => b, z => y);
end architecture rtl;
