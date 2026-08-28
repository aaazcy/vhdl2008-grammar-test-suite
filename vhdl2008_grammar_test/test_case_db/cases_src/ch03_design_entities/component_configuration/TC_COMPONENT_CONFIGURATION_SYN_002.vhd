-- =============================================================
-- Case ID: TC_COMPONENT_CONFIGURATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.3
-- Production: component_configuration ::= for component_specification use binding_indication [ block_configuration ] ;
-- Case Type: Positive
-- Test Focus: Component configuration with complete generic map + port map binding: for instantiation_list:component_name use entity_aspect generic_map_aspect port_map_aspect, verifying all clauses of component_configuration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dff is
  generic (Tpd:time:=1 ns; Tsu:time:=500 ps);
  port (clk:in bit; d:in bit; q:out bit);
end entity dff;

architecture rtl of dff is
begin
end architecture rtl;

entity cc2_ent is port(clk,d:in bit; q:out bit); end entity;
architecture rtl of cc2_ent is
  component dff is generic(Tpd:time:=1 ns; Tsu:time:=500 ps); port(clk:in bit; d:in bit; q:out bit); end component;
  for u_dff:dff use entity work.dff(rtl) generic map(Tpd=>800 ps, Tsu=>200 ps) port map(clk=>clk,d=>d,q=>q);
  signal s_q:bit;
begin u_dff:dff generic map(Tpd=>1 ns) port map(clk=>clk,d=>d,q=>s_q); q<=s_q; end architecture;
