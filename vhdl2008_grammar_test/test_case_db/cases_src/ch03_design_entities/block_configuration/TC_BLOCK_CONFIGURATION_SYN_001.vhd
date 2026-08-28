-- =============================================================
-- Case ID: TC_BLOCK_CONFIGURATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_configuration ::= for block_specification { use_clause } { configuration_item } end for ;
-- Case Type: Positive
-- Test Focus: minimal block_configuration: a single for architecture_name binding, with neither use_clause nor configuration_item, verifying the most basic form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bcfg_min_ent is
  port(a, b : in bit; y : out bit);
end entity;
architecture rtl of bcfg_min_ent is
  component and2 is port(i1, i2 : in bit; o : out bit); end component;
  signal s_and : bit;
begin
  u_and : and2 port map(i1 => a, i2 => b, o => s_and);
  y <= s_and;
end architecture;
configuration bcfg_min_cfg of bcfg_min_ent is
  for rtl
  end for;
end configuration bcfg_min_cfg;
