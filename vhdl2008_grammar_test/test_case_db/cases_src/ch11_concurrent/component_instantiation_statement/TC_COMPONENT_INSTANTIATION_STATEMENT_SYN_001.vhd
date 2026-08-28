-- =============================================================
-- Case ID: TC_COMPONENT_INSTANTIATION_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_INSTANTIATION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.7
-- Production: component_instantiation_statement ::= instantiation_label : instantiated_unit [ generic_map_aspect ] [ port_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: Component instantiation with generic map + port map: instantiation_label "u_dff", the component is declared beforehand (generic+port), and instantiation uses generic map (explicit value) + port map (mixed positional and named association), verifying the complete component_instantiation syntax
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ci_ent is port(clk,d:in bit; q:out bit); end entity;
architecture bh of ci_ent is
  component dff is
    generic(Tpd:time:=1 ns);
    port(clk:in bit; d:in bit; q:out bit);
  end component;
  signal s_q:bit;
begin
  u_dff:dff generic map(Tpd=>500 ps) port map(clk=>clk,d=>d,q=>s_q);
  q<=s_q;
end architecture bh;
