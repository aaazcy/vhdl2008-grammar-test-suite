-- =============================================================
-- Case ID: TC_COMPONENT_SPECIFICATION_SNN_002
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_COMPONENT_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: component_specification ::= instantiation_list : component_name
-- Case Type: Negative
-- Test Focus: Missing colon separator between instantiation_list and component_name — "for u_and gate_and" without ":" violates the production syntax
-- Expected Result: Triggers syntax error (missing colon)
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity cs_missing_colon is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of cs_missing_colon is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  -- ERROR: missing ':' between instantiation_list and component_name
  for u_and gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y);
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y);
end architecture bh;
