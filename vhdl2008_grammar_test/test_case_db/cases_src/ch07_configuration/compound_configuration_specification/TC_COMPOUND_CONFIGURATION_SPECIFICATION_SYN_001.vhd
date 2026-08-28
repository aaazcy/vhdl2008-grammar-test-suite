-- =============================================================
-- Case ID: TC_COMPOUND_CONFIGURATION_SPECIFICATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOUND_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: compound_configuration_specification ::= for component_specification binding_indication ; verification_unit_binding_indication ; { verification_unit_binding_indication ; } end for ;
-- Case Type: Positive
-- Test Focus: Minimal compound configuration — exercises the full compound form "for ... use ... ; use vunit ... ; end for ;" with one verification_unit_binding_indication and explicit binding_indication
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity ccs_minimal is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of ccs_minimal is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_and : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y);
    use vunit and_check;
  end for;
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y);
end architecture bh;
