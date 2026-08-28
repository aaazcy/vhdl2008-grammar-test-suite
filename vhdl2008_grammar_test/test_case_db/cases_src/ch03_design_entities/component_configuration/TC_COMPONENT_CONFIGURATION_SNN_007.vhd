-- =============================================================
-- Case ID: TC_COMPONENT_CONFIGURATION_SNN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.3
-- Production: component_configuration ::= for component_specification [ binding_indication ] [ block_configuration ] end for ;
-- Case Type: Negative
-- Test Focus: Malformed component_specification in component_configuration: for is directly followed by a colon without a label name, causing the instantiation_list of component_specification to fail parsing
-- Expected Result: Triggers syntax error on malformed component_specification
-- Dependencies: None
-- =============================================================
entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity ccfg_snn7_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of ccfg_snn7_ent is
  component inv is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture;
configuration ccfg_snn7_cfg of ccfg_snn7_ent is
  for rtl
    for :inv use entity work.inv(rtl);
  end for;
end configuration ccfg_snn7_cfg;
