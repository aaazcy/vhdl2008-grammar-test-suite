-- =============================================================
-- Case ID: TC_COMPONENT_CONFIGURATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.3
-- Production: component_configuration ::= for component_specification [ binding_indication ] [ block_configuration ] end for ;
-- Case Type: Positive
-- Test Focus: component_configuration with binding_indication (with generic map): for label:comp use entity work.ent(arch) generic map(g1=>val1, g2=>val2), verifying a component_configuration whose binding contains a generic mapping
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dff is
  generic (Tpd:time; Tsu:time);
  port (clk:in bit; d:in bit; q:out bit);
end entity dff;

architecture rtl of dff is
begin
end architecture rtl;

entity ccfg_gmap_ent is
  port(clk,d:in bit; q:out bit);
end entity;
architecture rtl of ccfg_gmap_ent is
  component dff is
    generic(Tpd:time; Tsu:time);
    port(clk:in bit; d:in bit; q:out bit);
  end component;
  signal s_q:bit;
begin
  u_dff:dff generic map(Tpd=>1 ns, Tsu=>500 ps) port map(clk=>clk,d=>d,q=>s_q);
  q<=s_q;
end architecture;
configuration ccfg_gmap_cfg of ccfg_gmap_ent is
  for rtl
    for u_dff:dff use entity work.dff(rtl)
      generic map(Tpd=>1200 ps, Tsu=>300 ps);
    end for;
  end for;
end configuration ccfg_gmap_cfg;
