-- =============================================================
-- Case ID: TC_COMPONENT_INSTANTIATION_STATEMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_COMPONENT_INSTANTIATION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: component_instantiation_statement ::= instantiation_label : instantiated_unit [ generic_map_aspect ] [ port_map_aspect ] ;
-- Rule Description: The instantiated entity must be visible and bound at elaboration time; referencing a non-existent entity causes an error
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SMN: instantiated_unit references a non-existent entity — `entity work.nonexistent` points to an undefined entity name, verifying that entity binding fails with an error at elaboration
-- Expected Result: Triggers elaboration error: entity "nonexistent" not found
-- Dependencies: None
-- =============================================================
entity ci_smn2_ent is
  port(a, b : in bit; y : out bit);
end entity ci_smn2_ent;
architecture struct of ci_smn2_ent is
begin
  u_bad : entity work.nonexistent port map(x => a, y => b, z => y);
end architecture struct;
