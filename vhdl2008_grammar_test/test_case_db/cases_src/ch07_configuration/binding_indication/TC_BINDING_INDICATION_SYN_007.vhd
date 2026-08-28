-- =============================================================
-- Case ID: TC_BINDING_INDICATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.2.1
-- Production: binding_indication ::= [ use entity_aspect ] [ generic_map_aspect ] [ port_map_aspect ]
-- Case Type: Positive
-- Test Focus: binding_indication with entity_aspect + generic_map_aspect but no port_map_aspect — exercises two of three optional clauses, where formal/actual port names match by default so no explicit port map is needed
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dff_sync is
  generic (DELAY : time := 1 ns; RETIME : boolean := false);
  port (clk : in bit; d : in bit; q : out bit);
end entity dff_sync;

architecture rtl of dff_sync is
begin
end architecture rtl;

entity bi_entity_generic is
  port(clk,d : in bit; q : out bit);
end entity;

architecture bh of bi_entity_generic is
  component dff_sync is
    generic(DELAY : time := 1 ns; RETIME : boolean := false);
    port(clk : in bit; d : in bit; q : out bit);
  end component;
  for u_dff : dff_sync use entity work.dff_sync(rtl)
    generic map(DELAY => 500 ps, RETIME => true);
begin
  u_dff : dff_sync port map(clk=>clk, d=>d, q=>q);
end architecture bh;
