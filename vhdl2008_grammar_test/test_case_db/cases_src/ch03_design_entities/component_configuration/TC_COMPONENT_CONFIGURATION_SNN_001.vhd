-- =============================================================
-- Case ID: TC_COMPONENT_CONFIGURATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.3
-- Production: component_configuration ::= for component_specification [ binding_indication ] [ block_configuration ] end for ;
-- Case Type: Negative
-- Test Focus: component_configuration missing keyword for: in the configuration declaration the for keyword is missing before component_specification, so it cannot be recognized as the legal start marker of a component_configuration
-- Expected Result: Triggers syntax error on missing 'for' keyword
-- Dependencies: None
-- =============================================================
entity buf is
  port (x:in bit; z:out bit);
end entity buf;

architecture rtl of buf is
begin
end architecture rtl;

entity ccfg_snn1_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of ccfg_snn1_ent is
  component buf is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_buf:buf port map(x=>a,z=>s); y<=s;
end architecture;
configuration ccfg_snn1_cfg of ccfg_snn1_ent is
  for rtl
    u_buf:buf use entity work.buf(rtl);
  end for;
end configuration ccfg_snn1_cfg;
