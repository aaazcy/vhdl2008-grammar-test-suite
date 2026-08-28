-- =============================================================
-- Case ID: TC_COMPONENT_CONFIGURATION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.3
-- Production: component_configuration ::= for component_specification [ binding_indication ] [ block_configuration ] end for ;
-- Case Type: Negative
-- Test Focus: component_configuration missing semicolon after end for: in the configuration declaration the component_configuration lacks the required semicolon terminator after end for, verifying the statement termination marker
-- Expected Result: Triggers syntax error on missing semicolon after 'end for'
-- Dependencies: None
-- =============================================================
entity buf is
  port (x:in bit; z:out bit);
end entity buf;

architecture rtl of buf is
begin
end architecture rtl;

entity ccfg_snn6_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of ccfg_snn6_ent is
  component buf is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_buf:buf port map(x=>a,z=>s); y<=s;
end architecture;
configuration ccfg_snn6_cfg of ccfg_snn6_ent is
  for rtl
    for u_buf:buf use entity work.buf(rtl)
  end for;
end configuration ccfg_snn6_cfg;
