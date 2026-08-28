-- =============================================================
-- Case ID: TC_COMPONENT_INSTANTIATION_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_INSTANTIATION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: component_instantiation_statement ::= instantiation_label : instantiated_unit [ generic_map_aspect ] [ port_map_aspect ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing instantiation_label — `entity work.adder port map(...)` has no label and colon before it, verifying that a component instantiation must begin with a label
-- Expected Result: Triggers syntax error: missing instantiation label
-- Dependencies: None
-- =============================================================
entity ci_snn1_ent is
  port(a, b : in bit; y : out bit);
end entity ci_snn1_ent;

entity and_gate is port(x, y : in bit; z : out bit); end entity and_gate;
architecture dataflow of and_gate is begin z <= x and y; end architecture dataflow;

architecture struct of ci_snn1_ent is
begin
  entity work.and_gate port map(a, b, y);
end architecture struct;
