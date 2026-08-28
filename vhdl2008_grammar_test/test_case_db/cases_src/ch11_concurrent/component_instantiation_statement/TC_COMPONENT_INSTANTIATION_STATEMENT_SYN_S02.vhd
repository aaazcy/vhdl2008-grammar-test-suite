-- =============================================================
-- Case ID: TC_COMPONENT_INSTANTIATION_STATEMENT_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_INSTANTIATION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: component_instantiation_statement ::= instantiation_label : instantiated_unit [ generic_map_aspect ] [ port_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: component with generic map + port map
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ci_spc2_ent is
  generic(W : integer := 8);
  port(d: in bit_vector(W-1 downto 0); q: out bit_vector(W-1 downto 0));
end entity;
architecture bh of ci_spc2_ent is
  component dff is
    generic(N : integer := 4);
    port(clk:in bit; d:in bit_vector(N-1 downto 0); q:out bit_vector(N-1 downto 0));
  end component;
  signal s_clk : bit := '0';
begin
  u_dff : dff
    generic map(N => W)
    port map(clk => s_clk, d => d, q => q);
end architecture bh;
