-- =============================================================
-- Case ID: TC_BLOCK_CONFIGURATION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_configuration ::= for block_specification { use_clause } { configuration_item } end for ;
-- Case Type: Negative
-- Test Focus: block_configuration semantic error: the generic name specified by generic map in component_configuration does not exist in the entity
-- Expected Result: Triggers semantic error: generic name not found in entity
-- Dependencies: None
-- =============================================================
entity dff is
  generic (Tpd : time);
  port (clk, d : in bit; q : out bit);
end entity dff;

architecture rtl of dff is
begin
end architecture rtl;

entity bcfg_smn2_ent is
  port(clk, d : in bit; q : out bit);
end entity;
architecture rtl of bcfg_smn2_ent is
  component dff is generic(Tpd : time); port(clk, d : in bit; q : out bit); end component;
  signal s_q : bit;
begin
  u_dff : dff generic map(Tpd => 1 ns) port map(clk => clk, d => d, q => s_q);
  q <= s_q;
end architecture;
configuration bcfg_smn2_cfg of bcfg_smn2_ent is
  for rtl
    for u_dff : dff
      use entity work.dff(rtl)
        generic map(NonexistentGeneric => 1 ns)
        port map(clk => clk, d => d, q => q);
    end for;
  end for;
end configuration bcfg_smn2_cfg;
