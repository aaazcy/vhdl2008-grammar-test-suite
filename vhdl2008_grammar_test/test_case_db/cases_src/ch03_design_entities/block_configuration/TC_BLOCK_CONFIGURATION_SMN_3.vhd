-- =============================================================
-- Case ID: TC_BLOCK_CONFIGURATION_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_configuration ::= for block_specification { use_clause } { configuration_item } end for ;
-- Case Type: Negative
-- Test Focus: block_configuration semantic error: in the configuration item of generated block gen_reg, component dff is bound to entity ghost_dff which does not exist in library work, verifying that the analyzer performs an existence check on the bound entity of the configuration item and rejects dangling bindings
-- Expected Result: Triggers semantic error: unit ghost_dff not found in library work
-- Dependencies: None
-- =============================================================
entity bcfg_sem2_ent is
  port(clk, d : in bit; q : out bit);
end entity;
architecture rtl of bcfg_sem2_ent is
  component dff is port(clk, d : in bit; q : out bit); end component;
begin
  gen_reg : for i in 0 to 1 generate
    u_ff : dff port map(clk => clk, d => d, q => q);
  end generate;
end architecture;
configuration bcfg_sem2_cfg of bcfg_sem2_ent is
  for rtl
    for gen_reg(0)
      for u_ff : dff use entity work.ghost_dff;
      end for;
    end for;
  end for;
end configuration bcfg_sem2_cfg;
