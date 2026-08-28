-- =============================================================
-- Case ID: TC_COMPONENT_INSTANTIATION_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_INSTANTIATION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: component_instantiation_statement ::= instantiation_label : instantiated_unit [ generic_map_aspect ] [ port_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: minimal form: only entity name and port map — `u_add : entity work.adder4 port map(a,b,sum);` uses positional association with no generic map, verifying the minimal legal form of component instantiation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ci_min_ent is
  port(a, b : in bit_vector(3 downto 0); sum : out bit_vector(3 downto 0));
end entity ci_min_ent;

entity adder4 is
  port(x, y : in bit_vector(3 downto 0); s : out bit_vector(3 downto 0));
end entity adder4;
architecture dataflow of adder4 is
begin
  s <= x xor y;
end architecture dataflow;

architecture struct of ci_min_ent is
begin
  u_add : entity work.adder4 port map(a, b, sum);
end architecture struct;
