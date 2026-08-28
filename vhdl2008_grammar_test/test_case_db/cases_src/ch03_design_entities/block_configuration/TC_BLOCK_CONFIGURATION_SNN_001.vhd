-- =============================================================
-- Case ID: TC_BLOCK_CONFIGURATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_configuration ::= for block_specification { use_clause } { configuration_item } end for ;
-- Case Type: Negative
-- Test Focus: block_configuration missing the "end for" keyword — after binding for architecture the configuration ends directly without "end for", verifying that block_configuration must close the for block
-- Expected Result: Triggers syntax error: missing "end for" after block_configuration
-- Dependencies: None
-- =============================================================
entity bcfg_snn1_ent is
  port(a : in bit; y : out bit);
end entity;
architecture rtl of bcfg_snn1_ent is
  component buf1 is port(a : in bit; z : out bit); end component;
  signal s_buf : bit;
begin
  u_buf : buf1 port map(a => a, z => s_buf);
  y <= s_buf;
end architecture;
configuration bcfg_snn1_cfg of bcfg_snn1_ent is
  for rtl
  -- ERROR: missing "end for;"
end configuration bcfg_snn1_cfg;
