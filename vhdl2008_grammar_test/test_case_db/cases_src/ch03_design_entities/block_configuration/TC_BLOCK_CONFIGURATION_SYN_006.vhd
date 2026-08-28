-- =============================================================
-- Case ID: TC_BLOCK_CONFIGURATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: block_configuration ::= for block_specification { use_clause } { configuration_item } end for ;
-- Case Type: Positive
-- Test Focus: block_configuration with generate_label index: for generate_statement_label(0) specifies a concrete generate index, with a nested component_configuration containing an entity binding
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dff is
  port (clk, d : in bit; q : out bit);
end entity dff;

architecture rtl of dff is
begin
end architecture rtl;

entity bcfg_gen_ent is
  port(clk, d : in bit; q : out bit_vector(1 downto 0));
end entity;
architecture rtl of bcfg_gen_ent is
  component dff is port(clk, d : in bit; q : out bit); end component;
begin
  gen_reg : for i in 0 to 1 generate
    u_ff : dff port map(clk => clk, d => d, q => q(i));
  end generate;
end architecture;
configuration bcfg_gen_cfg of bcfg_gen_ent is
  for rtl
    for gen_reg(1)
      for u_ff : dff use entity work.dff(rtl);
      end for;
    end for;
  end for;
end configuration bcfg_gen_cfg;
