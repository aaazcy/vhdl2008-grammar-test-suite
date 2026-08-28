-- =============================================================
-- Case ID: TC_COMPONENT_CONFIGURATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.3
-- Production: component_configuration ::= for component_specification [ binding_indication ] [ block_configuration ] end for ;
-- Case Type: Negative
-- Test Focus: component_configuration missing the closing keyword end for: in the configuration declaration the component_configuration has for component_specification but lacks the corresponding end for closure, verifying the required end for syntax marker
-- Expected Result: Triggers syntax error on missing 'end for' closure
-- Dependencies: None
-- =============================================================
entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity ccfg_snn4_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of ccfg_snn4_ent is
  component inv is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture;
configuration ccfg_snn4_cfg of ccfg_snn4_ent is
  for rtl
    for u_inv:inv use entity work.inv(rtl);
end configuration ccfg_snn4_cfg;
