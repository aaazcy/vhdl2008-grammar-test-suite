-- =============================================================
-- Case ID: TC_BLOCK_CONFIGURATION_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_configuration ::= for block_specification { use_clause } { configuration_item } end for ;
-- Case Type: Negative
-- Test Focus: block_configuration semantic error: the label specified by for block_label does not exist in the architecture, verifying that block_specification must reference an actually existing block or generate label
-- Expected Result: Triggers semantic error: block label not found in architecture
-- Dependencies: None
-- =============================================================
entity bcfg_sem1_ent is
  port(x : in bit; z : out bit);
end entity;
architecture rtl of bcfg_sem1_ent is
  component inv is port(a : in bit; y : out bit); end component;
  signal s_inv : bit;
begin
  u_inv : inv port map(a => x, y => s_inv);
  z <= s_inv;
end architecture;
configuration bcfg_sem1_cfg of bcfg_sem1_ent is
  for rtl
    for nonexistent_block
    end for;
  end for;
end configuration bcfg_sem1_cfg;
