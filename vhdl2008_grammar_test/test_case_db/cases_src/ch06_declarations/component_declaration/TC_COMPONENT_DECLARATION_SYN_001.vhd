-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Component full form: with generic_clause(2 generics integer+time) + port_clause(4 ports all modes) / end component with identifier, verifying the complete generic+port form of component_declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity comp_ent is port(clk,d:in bit; q:out bit); end entity;
architecture bh of comp_ent is
  component dff is
    generic(Tpd:time:=1 ns; Tsu:time:=500 ps);
    port(clk:in bit; d:in bit; q:out bit);
  end component dff;
  signal s_q:bit;
begin
  u_dff:dff generic map(Tpd=>1 ns, Tsu=>300 ps) port map(clk=>clk,d=>d,q=>s_q);
  q<=s_q;
end architecture bh;
