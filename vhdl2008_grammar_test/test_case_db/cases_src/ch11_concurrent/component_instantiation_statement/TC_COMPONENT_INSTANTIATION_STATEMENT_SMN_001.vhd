-- =============================================================
-- Case ID: TC_COMPONENT_INSTANTIATION_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_COMPONENT_INSTANTIATION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: component_instantiation_statement ::= instantiation_label : instantiated_unit [ generic_map_aspect ] [ port_map_aspect ] ;
-- Rule Description: The actual signal in a port map must be compatible with the formal port's type; width mismatches cause elaboration errors
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: width mismatch between actual and formal in the port map — the formal port `z` is bit_vector(3 downto 0) but the actual `y` is bit_vector(7 downto 0), verifying that widths must match in port association
-- Expected Result: Triggers elaboration error: port width mismatch in component instantiation
-- Dependencies: None
-- =============================================================
entity ci_smn1_ent is
  port(a, b : in bit_vector(7 downto 0); y : out bit_vector(7 downto 0));
end entity ci_smn1_ent;

entity and4 is port(x, y : in bit_vector(3 downto 0); z : out bit_vector(3 downto 0)); end entity and4;
architecture dataflow of and4 is begin z <= x and y; end architecture dataflow;

architecture struct of ci_smn1_ent is
begin
  u_bad : entity work.and4
    port map(x => a(3 downto 0), y => b(3 downto 0), z => y);
end architecture struct;
