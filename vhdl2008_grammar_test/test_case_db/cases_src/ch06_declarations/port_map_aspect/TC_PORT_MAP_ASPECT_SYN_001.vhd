-- =============================================================
-- Case ID: TC_PORT_MAP_ASPECT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PORT_MAP_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: port_map_aspect ::= port map ( association_list )
-- Case Type: Positive
-- Test Focus: Port map named+positional mixed+open: 3 component instantiations respectively use named association(clk=>clk) / positional association(clk,d,q) / open(output port unconnected), verifying all association forms of port_map_aspect and open for output ports
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pma_ent is port(clk,d:in bit; q1,q2:out bit); end entity;
architecture bh of pma_ent is
  component dff is port(clk:in bit; d:in bit; q:out bit); end component;
  signal s_q1,s_q2:bit;
begin
  u1:dff port map(clk=>clk,d=>d,q=>s_q1);
  u2:dff port map(clk,d,s_q2);
  u3:dff port map(clk=>clk,d=>d,q=>open);
  q1<=s_q1; q2<=s_q2;
end architecture bh;
