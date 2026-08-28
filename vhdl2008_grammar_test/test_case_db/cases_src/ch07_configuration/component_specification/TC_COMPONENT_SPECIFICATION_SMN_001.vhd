-- =============================================================
-- Case ID: TC_COMPONENT_SPECIFICATION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_COMPONENT_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: component_specification ::= instantiation_list : component_name
-- Case Type: Negative (Semantic)
-- Test Focus: component_specification references a component_name ghost_gate that has never been declared — the configuration specification 'for u_and : ghost_gate' cannot resolve the component name, so the specification is rejected
-- Expected Result: Triggers semantic error: no declaration for "ghost_gate"
-- Dependencies: None
-- =============================================================
entity bind_target is
  port(x1,x2 : in bit; z : out bit);
end entity;
architecture bind_rtl of bind_target is
begin
  z <= x1 and x2;
end architecture;
entity cs_smn1_ent is
  port(a,b:in bit; y:out bit);
end entity;
architecture bh of cs_smn1_ent is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_and : ghost_gate use entity work.bind_target(bind_rtl);
  signal s_a : bit := '0';
  signal s_b : bit := '0';
  signal s_y : bit := '0';
begin
  u_and : gate_and port map(x1=>s_a, x2=>s_b, z=>s_y);
  y <= s_y;
end architecture bh;
