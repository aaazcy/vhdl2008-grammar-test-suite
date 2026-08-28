-- =============================================================
-- Case ID: TC_COMPONENT_SPECIFICATION_SEM_001
-- Related Rule ID: SEM_COMPONEN_001
-- Rule Type: Semantic
-- BNF Production: COMPONENT_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: component_specification ::= instantiation_list : component_name
-- Case Type: Positive (Semantic)
-- Test Focus: Component specification with configuration entity aspect — verifies that component_specification correctly identifies instances and the binding_indication maps them to a configuration entity, exercising the full configuration_specification path
-- Expected Result: Compiles successfully; semantic binding verified
-- Dependencies: None
-- =============================================================
entity gate_xnor is
  port (x1,x2 : in bit; z : out bit);
end entity gate_xnor;

architecture beh of gate_xnor is
begin
end architecture beh;

entity cs_sem_binding is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of cs_sem_binding is
  component gate_xnor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_xnor : gate_xnor use entity work.gate_xnor(beh)
    port map(x1=>a, x2=>b, z=>y);
  signal s_and_val : bit := '0';
  function f_and(x,y : bit) return bit is
  begin return x and y; end function;
begin
  u_xnor : gate_xnor port map(x1=>a, x2=>b, z=>y);
  s_and_val <= f_and(a, b);
end architecture bh;
