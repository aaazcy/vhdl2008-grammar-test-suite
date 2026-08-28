-- =============================================================
-- Case ID: TC_COMPONENT_INSTANTIATION_STATEMENT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_COMPONENT_INSTANTIATION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: component_instantiation_statement ::= instantiation_label : instantiated_unit [ generic_map_aspect ] [ port_map_aspect ] ;
-- Rule Description: Generic map aspect overrides the default values of formal generics; the actual must be of the same type as the formal generic
-- Case Type: Positive
-- Test Focus: generic map passes values of different types — the integer generic `DW` is overridden to 8 and the time generic `TD` is overridden to 2 ns, verifying that multiple generics are overridden at once with correctly matching types
-- Expected Result: Compiles successfully; generics correctly override defaults
-- Dependencies: None
-- =============================================================
entity ci_sem2_ent is
  port(a, b : in bit_vector(7 downto 0); y : out bit_vector(7 downto 0));
end entity ci_sem2_ent;

entity delay_gate is
  generic(DW : integer := 4; TD : time := 1 ns);
  port(x, y : in bit_vector(DW-1 downto 0); z : out bit_vector(DW-1 downto 0));
end entity delay_gate;
architecture dataflow of delay_gate is
begin
  z <= (x and y) after TD;
end architecture dataflow;

architecture struct of ci_sem2_ent is
begin
  u_dly : entity work.delay_gate
    generic map(DW => 8, TD => 2 ns)
    port map(x => a, y => b, z => y);
end architecture struct;
