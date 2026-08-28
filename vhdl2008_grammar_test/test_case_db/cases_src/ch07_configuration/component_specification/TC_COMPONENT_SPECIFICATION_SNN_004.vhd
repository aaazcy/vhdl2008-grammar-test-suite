-- =============================================================
-- Case ID: TC_COMPONENT_SPECIFICATION_SNN_004
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_COMPONENT_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: component_specification ::= instantiation_list : component_name
-- Case Type: Negative
-- Test Focus: Empty instantiation_list before colon — "for : gate_and" has no labels, which violates the instantiation_list grammar; at least one label, "others", or "all" is required
-- Expected Result: Triggers syntax error (empty instantiation list)
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity cs_empty_label_list is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of cs_empty_label_list is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  -- ERROR: empty instantiation_list, nothing before colon
  for : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y);
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y);
end architecture bh;
