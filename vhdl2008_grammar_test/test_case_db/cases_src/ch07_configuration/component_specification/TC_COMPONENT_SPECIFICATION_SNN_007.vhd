-- =============================================================
-- Case ID: TC_COMPONENT_SPECIFICATION_SNN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: component_specification ::= instantiation_list : component_name
-- Case Type: Negative
-- Test Focus: Duplicate label in instantiation_list — "for u_and, u_and : gate_and" repeats the same label twice; the grammar requires each instantiation_label to be unique within the instantiation_list
-- Expected Result: Triggers semantic error (duplicate label in instantiation list)
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity cs_dup_label is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of cs_dup_label is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  -- ERROR: duplicate label 'u_and' in instantiation_list
  for u_and, u_and : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y);
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y);
end architecture bh;
