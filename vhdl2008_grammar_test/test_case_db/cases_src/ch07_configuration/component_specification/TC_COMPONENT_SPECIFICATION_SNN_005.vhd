-- =============================================================
-- Case ID: TC_COMPONENT_SPECIFICATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: component_specification ::= instantiation_list : component_name
-- Case Type: Negative
-- Test Focus: Trailing comma in instantiation_list — "for u_and, u_or, : gate_and" has a comma before the colon which leaves an empty label slot; the grammar requires each element to be a valid instantiation_label
-- Expected Result: Triggers syntax error (trailing comma in instantiation list)
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity cs_trailing_comma is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of cs_trailing_comma is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  -- ERROR: trailing comma before colon in instantiation_list
  for u_and, : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y);
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y);
end architecture bh;
