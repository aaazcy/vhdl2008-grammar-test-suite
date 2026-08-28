-- =============================================================
-- Case ID: TC_BLOCK_CONFIGURATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_configuration ::= for block_specification { use_clause } { configuration_item } end for ;
-- Case Type: Positive
-- Test Focus: block_configuration with a single use_clause: a use clause referencing a library unit declared before the for architecture binding, verifying the legal position of use_clause after block_specification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bcfg_use_ent is
  port(din : in bit; dout : out bit);
end entity;
architecture rtl of bcfg_use_ent is
  component buf1 is port(a : in bit; z : out bit); end component;
  signal s_buf : bit;
begin
  u_buf : buf1 port map(a => din, z => s_buf);
  dout <= s_buf;
end architecture;
configuration bcfg_use_cfg of bcfg_use_ent is
  for rtl
    use work.all;
  end for;
end configuration bcfg_use_cfg;
