-- =============================================================
-- Case ID: TC_COMPONENT_INSTANTIATION_STATEMENT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_COMPONENT_INSTANTIATION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: component_instantiation_statement ::= instantiation_label : instantiated_unit [ generic_map_aspect ] [ port_map_aspect ] ;
-- Rule Description: Each component instantiation statement creates one instance of the specified entity/component/configuration; port actuals must match the formal port's type, mode, and direction
-- Case Type: Positive
-- Test Focus: chained instantiation — three component instantiations are connected in series to form a datapath: the output of u1 feeds the input of u2, and the output of u2 feeds the input of u3, verifying that multiple instantiations form a pipeline through signal connections
-- Expected Result: Compiles successfully; instances form a valid data path chain
-- Dependencies: None
-- =============================================================
entity ci_sem1_ent is
  port(a, b : in bit_vector(7 downto 0); y : out bit_vector(7 downto 0));
end entity ci_sem1_ent;

entity and8 is port(x, y : in bit_vector(7 downto 0); z : out bit_vector(7 downto 0)); end entity and8;
architecture dataflow of and8 is begin z <= x and y; end architecture dataflow;

entity or8 is port(x, y : in bit_vector(7 downto 0); z : out bit_vector(7 downto 0)); end entity or8;
architecture dataflow of or8 is begin z <= x or y; end architecture dataflow;

entity xor8 is port(x, y : in bit_vector(7 downto 0); z : out bit_vector(7 downto 0)); end entity xor8;
architecture dataflow of xor8 is begin z <= x xor y; end architecture dataflow;

architecture struct of ci_sem1_ent is
  signal s_and, s_or : bit_vector(7 downto 0);
begin
  u_and : entity work.and8 port map(x => a, y => b, z => s_and);
  u_or  : entity work.or8  port map(x => s_and, y => b, z => s_or);
  u_xor : entity work.xor8 port map(x => s_or, y => a, z => y);
end architecture struct;
