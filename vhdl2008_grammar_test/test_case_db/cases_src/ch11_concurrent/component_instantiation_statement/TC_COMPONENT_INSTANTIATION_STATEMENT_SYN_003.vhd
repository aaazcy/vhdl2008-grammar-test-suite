-- =============================================================
-- Case ID: TC_COMPONENT_INSTANTIATION_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_INSTANTIATION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: component_instantiation_statement ::= instantiation_label : instantiated_unit [ generic_map_aspect ] [ port_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: entity instantiation with generic map + port map — `generic map(DW => 8) port map(...)` passes both generic and port with named association, verifying that a complete instantiation contains generic override and port mapping
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ci_full_ent is
  port(a, b : in bit_vector(7 downto 0); y : out bit_vector(7 downto 0));
end entity ci_full_ent;

entity xor_gate is
  generic(DW : integer := 4);
  port(x, y : in bit_vector(DW-1 downto 0); z : out bit_vector(DW-1 downto 0));
end entity xor_gate;
architecture dataflow of xor_gate is
begin
  z <= x xor y;
end architecture dataflow;

architecture struct of ci_full_ent is
begin
  u_xor : entity work.xor_gate
    generic map(DW => 8)
    port map(x => a, y => b, z => y);
end architecture struct;
