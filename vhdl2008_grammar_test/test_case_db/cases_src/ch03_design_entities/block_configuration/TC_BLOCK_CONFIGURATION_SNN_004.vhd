-- =============================================================
-- Case ID: TC_BLOCK_CONFIGURATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_configuration ::= for block_specification { use_clause } { configuration_item } end for ;
-- Case Type: Negative
-- Test Focus: block_configuration nested component_configuration missing "end for" — the inner for component is not closed, verifying that every configuration_item must be fully closed
-- Expected Result: Triggers syntax error: missing "end for" before outer "end for"
-- Dependencies: None
-- =============================================================
entity dff is
  port (d, clk : in bit; q : out bit);
end entity dff;

architecture rtl of dff is
begin
end architecture rtl;

entity bcfg_snn4_ent is
  port(d : in bit; q : out bit);
end entity;
architecture rtl of bcfg_snn4_ent is
  component dff is port(d, clk : in bit; q : out bit); end component;
  signal s_q, s_clk : bit;
begin
  s_clk <= not s_clk after 5 ns;
  u_dff : dff port map(clk => s_clk, d => d, q => s_q);
  q <= s_q;
end architecture;
configuration bcfg_snn4_cfg of bcfg_snn4_ent is
  for rtl
    for u_dff : dff use entity work.dff(rtl);
    -- ERROR: inner "end for;" missing
  end for;
end configuration bcfg_snn4_cfg;
