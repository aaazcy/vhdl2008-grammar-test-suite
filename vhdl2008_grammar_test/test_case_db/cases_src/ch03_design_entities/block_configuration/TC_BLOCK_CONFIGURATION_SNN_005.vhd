-- =============================================================
-- Case ID: TC_BLOCK_CONFIGURATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_configuration ::= for block_specification { use_clause } { configuration_item } end for ;
-- Case Type: Negative
-- Test Focus: block_configuration missing the for keyword — an architecture_name is written directly without the "for" prefix, verifying that for is the required starting marker of block_configuration
-- Expected Result: Triggers syntax error: "for" keyword expected
-- Dependencies: None
-- =============================================================
entity bcfg_snn5_ent is
  port(x : in bit; z : out bit);
end entity;
architecture rtl of bcfg_snn5_ent is
  component inv is port(a : in bit; y : out bit); end component;
  signal s_inv : bit;
begin
  u_inv : inv port map(a => x, y => s_inv);
  z <= s_inv;
end architecture;
configuration bcfg_snn5_cfg of bcfg_snn5_ent is
  rtl
  end for;
end configuration bcfg_snn5_cfg;
