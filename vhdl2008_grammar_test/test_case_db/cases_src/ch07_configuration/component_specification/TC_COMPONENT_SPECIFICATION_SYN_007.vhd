-- =============================================================
-- Case ID: TC_COMPONENT_SPECIFICATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: component_specification ::= instantiation_list : component_name
-- Case Type: Positive
-- Test Focus: component_specification in simple form with no port map — exercises the component_specification where the binding_indication uses 'use open' with no port or generic map, stressing the minimal instantiation_list:component_name syntax with minimal binding
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cs_open_binding is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of cs_open_binding is
  component gate_xor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_xor : gate_xor use open;
begin
  u_xor : gate_xor port map(x1=>a, x2=>b, z=>y);
end architecture bh;
