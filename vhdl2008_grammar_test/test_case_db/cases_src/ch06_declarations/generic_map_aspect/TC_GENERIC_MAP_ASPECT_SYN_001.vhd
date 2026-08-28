-- =============================================================
-- Case ID: TC_GENERIC_MAP_ASPECT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERIC_MAP_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: generic_map_aspect ::= generic map ( association_list )
-- Case Type: Positive
-- Test Focus: Generic map named+positional mixed+open: the generic map of component instantiation has named association(G_DLY=>1ns) / positional association(8) / open(unassociated leaving default), verifying the three association styles of generic_map_aspect and the open keyword
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gma_ent is port(clk,d:in bit; q:out bit); end entity;
architecture bh of gma_ent is
  component reg_e is generic(W:integer:=8; R:integer:=4; D:time:=1 ns); port(clk:in bit; din:in bit; q:out bit); end component;
  signal s_q:bit;
begin
  u_reg:reg_e generic map(W=>16, R=>open, D=>500 ps) port map(clk=>clk,din=>d,q=>s_q);
  q<=s_q;
end architecture bh;
