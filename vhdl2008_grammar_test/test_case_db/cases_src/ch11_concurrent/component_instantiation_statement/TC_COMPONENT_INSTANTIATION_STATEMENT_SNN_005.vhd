-- =============================================================
-- Case ID: TC_COMPONENT_INSTANTIATION_STATEMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_INSTANTIATION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: component_instantiation_statement ::= instantiation_label : instantiated_unit [ generic_map_aspect ] [ port_map_aspect ] ;
-- Case Type: Negative
-- Test Focus: SNN: a port association in the port map is missing `=>` — in `port map(x => a, y b)` the second association uses a space instead of the arrow, verifying that formal and actual in a named association must be separated by `=>`
-- Expected Result: Triggers syntax error: missing "=>" in port map association
-- Dependencies: None
-- =============================================================
entity ci_snn5_ent is
  port(a, b : in bit; y : out bit);
end entity ci_snn5_ent;
architecture struct of ci_snn5_ent is
begin
  u_inst : entity work.and_gate port map(x => a, y b);
end architecture struct;
