-- =============================================================
-- Case ID: TC_COMPONENT_SPECIFICATION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: component_specification ::= instantiation_list : component_name
-- Test Focus: Component specification production-specific: single-label instantiation with explicit entity aspect and generic map — exercises instantiation_list:component_name as the core of configuration binding with port+generic mapping
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity cs_prod_specific is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of cs_prod_specific is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_and : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y);
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y);
end architecture bh;
