-- =============================================================
-- Case ID: TC_BLOCK_CONFIGURATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_configuration ::= for block_specification { use_clause } { configuration_item } end for ;
-- Case Type: Positive
-- Test Focus: block_configuration deep nesting: outer for architecture(rtl), middle for block_label specifying an inner block, inner for component binding a concrete entity — three-level nested block_configuration verifying hierarchical configuration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity latch is
  port (clk, d : in bit; q : out bit);
end entity latch;

architecture rtl of latch is
begin
end architecture rtl;

entity bcfg_deep_ent is
  port(clk, d : in bit; q : out bit);
end entity;
architecture rtl of bcfg_deep_ent is
  component latch is port(clk, d : in bit; q : out bit); end component;
  signal s_int : bit;
begin
  b_inner : block
    signal s_local : bit;
  begin
    u_latch : latch port map(clk => clk, d => d, q => s_local);
    s_int <= s_local;
  end block;
  q <= s_int;
end architecture;
configuration bcfg_deep_cfg of bcfg_deep_ent is
  for rtl
    for b_inner
      for u_latch : latch use entity work.latch(rtl);
      end for;
    end for;
  end for;
end configuration bcfg_deep_cfg;
