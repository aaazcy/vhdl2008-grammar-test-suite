-- =============================================================
-- Case ID: TC_BLOCK_CONFIGURATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: block_configuration ::= for block_specification { block_configuration | component_configuration } end for ;
-- Case Type: Positive
-- Test Focus: Block configuration nested component: outer for architecture binding, inner for component binding with port map+generic map, verifying the nesting of block_configuration combined with component_configuration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dff is
  generic (Tpd:time:=1 ns);
  port (clk:in bit; d:in bit; q:out bit);
end entity dff;

architecture rtl of dff is
begin
end architecture rtl;

entity bc2_ent is port(clk,d:in bit; q:out bit); end entity;
architecture rtl of bc2_ent is
  component dff is generic(Tpd:time:=1 ns); port(clk:in bit; d:in bit; q:out bit); end component;
  signal s_q:bit;
begin u_dff:dff generic map(Tpd=>500 ps) port map(clk=>clk,d=>d,q=>s_q); q<=s_q; end architecture;
configuration bc2_cfg of bc2_ent is
  for rtl
    for u_dff:dff use entity work.dff(rtl) generic map(Tpd=>300 ps) port map(clk=>clk,d=>d,q=>q);
    end for;
  end for;
end configuration bc2_cfg;
