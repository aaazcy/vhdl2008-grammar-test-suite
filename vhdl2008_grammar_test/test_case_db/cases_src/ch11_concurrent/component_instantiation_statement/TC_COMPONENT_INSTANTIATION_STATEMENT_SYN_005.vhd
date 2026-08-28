-- =============================================================
-- Case ID: TC_COMPONENT_INSTANTIATION_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_INSTANTIATION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: component_instantiation_statement ::= instantiation_label : instantiated_unit [ generic_map_aspect ] [ port_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: configuration instantiation — `u_cfg : configuration work.my_cfg` uses a configuration name as the instantiated_unit, verifying that an instantiation can reference a configuration declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ci_cfg_ent is
  port(a, b : in bit; y : out bit);
end entity ci_cfg_ent;

entity and2 is port(x, y : in bit; z : out bit); end entity and2;
architecture dataflow of and2 is begin z <= x and y; end architecture dataflow;

architecture bh of ci_cfg_ent is
begin
  y <= a and b;
end architecture bh;

configuration my_cfg of ci_cfg_ent is
  for bh
  end for;
end configuration my_cfg;

architecture bh2 of ci_cfg_ent is
begin
  u_cfg : configuration work.my_cfg port map(a => a, b => b, y => y);
end architecture bh2;
