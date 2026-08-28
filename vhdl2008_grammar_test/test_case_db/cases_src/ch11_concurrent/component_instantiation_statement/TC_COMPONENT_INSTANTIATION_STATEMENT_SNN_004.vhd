-- =============================================================
-- Case ID: TC_COMPONENT_INSTANTIATION_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_INSTANTIATION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: component_instantiation_statement ::= instantiation_label : instantiated_unit [ generic_map_aspect ] [ port_map_aspect ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing terminating semicolon — `u_inst : entity work.and_gate port map(a,b,y)` has no trailing semicolon, verifying that a component instantiation statement must terminate with a semicolon
-- Expected Result: Triggers syntax error: missing ";" after component instantiation
-- Dependencies: None
-- =============================================================
entity ci_snn4_ent is
  port(a, b : in bit; y : out bit);
end entity ci_snn4_ent;
architecture struct of ci_snn4_ent is
begin
  u_inst : entity work.and_gate port map(a, b, y)
end architecture struct;
