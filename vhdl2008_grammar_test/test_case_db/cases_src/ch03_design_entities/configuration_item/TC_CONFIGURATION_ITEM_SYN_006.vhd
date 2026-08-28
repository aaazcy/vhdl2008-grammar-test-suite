-- =============================================================
-- Case ID: TC_CONFIGURATION_ITEM_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: configuration_item ::= block_configuration | component_configuration
-- Case Type: Positive
-- Test Focus: Complete component_configuration with generic map + port map as configuration_item: for label:comp use entity...generic map(...) port map(...) as a configuration item, verifying the syntax of component_configuration with a complete binding indication as a configuration item
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dff_r is
  generic (Tpd:time);
  port (clk,rst,d:in bit; q:out bit);
end entity dff_r;

architecture rtl of dff_r is
begin
end architecture rtl;

entity ci_fullmap_ent is
  port(clk,rst,d:in bit; q:out bit);
end entity;
architecture rtl of ci_fullmap_ent is
  component dff_r is
    generic(Tpd:time);
    port(clk,rst,d:in bit; q:out bit);
  end component;
  signal s_q:bit;
begin
  u_dff:dff_r generic map(Tpd=>1 ns) port map(clk=>clk,rst=>rst,d=>d,q=>s_q);
  q<=s_q;
end architecture;
configuration ci_fullmap_cfg of ci_fullmap_ent is
  for rtl
    for u_dff:dff_r use entity work.dff_r(rtl)
      generic map(Tpd=>950 ps)
      port map(clk=>clk, rst=>rst, d=>d, q=>s_q);
    end for;
  end for;
end configuration ci_fullmap_cfg;
