-- =============================================================
-- Case ID: TC_BLOCK_CONFIGURATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_configuration ::= for block_specification { use_clause } { configuration_item } end for ;
-- Case Type: Positive
-- Test Focus: block_configuration with multiple use_clauses and a single component_configuration: verifying the ordered combination of multiple use clauses with configuration_item
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dff is
  port (clk, rst, d : in bit; q : out bit);
end entity dff;

architecture rtl of dff is
begin
end architecture rtl;

entity bcfg_multi_ent is
  port(clk, rst : in bit; q : out bit);
end entity;
architecture rtl of bcfg_multi_ent is
  component dff is port(clk, rst, d : in bit; q : out bit); end component;
  signal s_q, s_d : bit;
begin
  s_d <= not s_q;
  u_dff : dff port map(clk => clk, rst => rst, d => s_d, q => s_q);
  q <= s_q;
end architecture;
configuration bcfg_multi_cfg of bcfg_multi_ent is
  for rtl
    use work.all;
    use std.standard.all;
    for u_dff : dff use entity work.dff(rtl);
    end for;
  end for;
end configuration bcfg_multi_cfg;
