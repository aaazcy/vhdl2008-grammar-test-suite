-- =============================================================
-- Case ID: TC_BLOCK_CONFIGURATION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_configuration ::= for block_specification { use_clause } { configuration_item } end for ;
-- Case Type: Negative
-- Test Focus: block_configuration use_clause syntax error — the use clause is missing the dot separator library.package, verifying that use_clause must be a legal selected_name
-- Expected Result: Triggers syntax error: invalid use clause syntax
-- Dependencies: None
-- =============================================================
entity bcfg_snn6_ent is
  port(din : in bit; dout : out bit);
end entity;
architecture rtl of bcfg_snn6_ent is
  component buf1 is port(a : in bit; z : out bit); end component;
  signal s_buf : bit;
begin
  u_buf : buf1 port map(a => din, z => s_buf);
  dout <= s_buf;
end architecture;
configuration bcfg_snn6_cfg of bcfg_snn6_ent is
  for rtl
    use work standard all;
  end for;
end configuration bcfg_snn6_cfg;
