-- =============================================================
-- Case ID: TC_COMPONENT_SPECIFICATION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: component_specification ::= instantiation_list : component_name
-- Case Type: Negative
-- Test Focus: "all" keyword mixed with explicit labels in same specification — "for u_labels, all : comp" mixes explicit labels with the 'all' keyword; the grammar does not allow mixing 'all'/'others' with explicit instantiation_labels
-- Expected Result: Triggers syntax error (mixed instantiation list)
-- Dependencies: None
-- =============================================================
entity gate_nor is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nor;

architecture rtl of gate_nor is
begin
end architecture rtl;

entity cs_mixed_all is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of cs_mixed_all is
  component gate_nor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  -- ERROR: cannot mix explicit label with 'all' keyword
  for u_nor1, all : gate_nor use entity work.gate_nor(rtl)
    port map(x1=>a, x2=>b, z=>y);
begin
  u_nor1 : gate_nor port map(x1=>a, x2=>b, z=>y);
end architecture bh;
