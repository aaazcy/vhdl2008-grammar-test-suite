-- =============================================================
-- Case ID: TC_BINDING_INDICATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: binding_indication ::= [ use entity_aspect ] [ generic_map_aspect ] [ port_map_aspect ]
-- Case Type: Positive
-- Test Focus: Binding indication all clauses: entity_aspect(use entity work.ent(rtl))+generic_map_aspect(explicit generic values)+port_map_aspect(named-association port map), verifying the simultaneous use of the three optional clauses of binding_indication in a configuration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity reg_e is
  generic (W:integer:=8; D:time:=1 ns);
  port (clk:in bit; d_in:in bit; q:out bit);
end entity reg_e;

architecture rtl of reg_e is
begin
end architecture rtl;

entity bi_ent is port(clk,d:in bit; q:out bit); end entity;
architecture bh of bi_ent is
  component reg_e is generic(W:integer:=8; D:time:=1 ns); port(clk:in bit; d_in:in bit; q:out bit); end component;
  for u_reg:reg_e use entity work.reg_e(rtl) generic map(W=>16,D=>500 ps) port map(clk=>clk,d_in=>d_in,q=>q);
  signal s_q:bit;
begin u_reg:reg_e port map(clk=>clk,d_in=>d,q=>s_q); q<=s_q; end architecture bh;
