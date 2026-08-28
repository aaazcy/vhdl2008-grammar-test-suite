-- =============================================================
-- Case ID: TC_BLOCK_CONFIGURATION_SNN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_configuration ::= for block_specification { use_clause } { configuration_item } end for ;
-- Case Type: Negative
-- Test Focus: block_configuration block_specification references a nonexistent architecture name — misspelled architecture_name
-- Expected Result: Triggers semantic error: architecture name not found
-- Dependencies: None
-- =============================================================
entity bcfg_snn7_ent is
  port(a : in bit; y : out bit);
end entity;
architecture rtl of bcfg_snn7_ent is
  component and2 is port(i1, i2 : in bit; o : out bit); end component;
  signal s_and : bit;
begin
  u_and : and2 port map(i1 => a, i2 => a, o => s_and);
  y <= s_and;
end architecture;
configuration bcfg_snn7_cfg of bcfg_snn7_ent is
  for nonexistent_arch
  end for;
end configuration bcfg_snn7_cfg;
