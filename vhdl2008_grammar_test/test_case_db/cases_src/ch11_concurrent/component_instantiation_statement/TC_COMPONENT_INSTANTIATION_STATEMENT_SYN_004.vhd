-- =============================================================
-- Case ID: TC_COMPONENT_INSTANTIATION_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_INSTANTIATION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: component_instantiation_statement ::= instantiation_label : instantiated_unit [ generic_map_aspect ] [ port_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: multiple instantiations — u_and, u_or, u_xor are three independent component instantiations in the same architecture, verifying that multiple instantiations can coexist and are independent of each other
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ci_multi_ent is
  port(a, b : in bit_vector(3 downto 0); y_and, y_or, y_xor : out bit_vector(3 downto 0));
end entity ci_multi_ent;

-- Supporting design units for the direct entity instantiations
entity and_gate is
  port(a, b : in bit_vector(3 downto 0); y : out bit_vector(3 downto 0));
end entity and_gate;
architecture beh of and_gate is
begin
  y <= a and b;
end architecture beh;

entity or_gate is
  port(a, b : in bit_vector(3 downto 0); y : out bit_vector(3 downto 0));
end entity or_gate;
architecture beh of or_gate is
begin
  y <= a or b;
end architecture beh;

entity xor_gate is
  port(a, b : in bit_vector(3 downto 0); y : out bit_vector(3 downto 0));
end entity xor_gate;
architecture beh of xor_gate is
begin
  y <= a xor b;
end architecture beh;

architecture struct of ci_multi_ent is
begin
  u_and : entity work.and_gate port map(a, b, y_and);
  u_or  : entity work.or_gate  port map(a, b, y_or);
  u_xor : entity work.xor_gate port map(a, b, y_xor);
end architecture struct;
