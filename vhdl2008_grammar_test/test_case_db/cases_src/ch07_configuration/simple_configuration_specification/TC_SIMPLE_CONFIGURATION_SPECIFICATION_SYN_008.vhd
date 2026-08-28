-- =============================================================
-- Case ID: TC_SIMPLE_CONFIGURATION_SPECIFICATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: simple_configuration_specification ::= for component_specification binding_indication [ ; ] end for [ ; ]
-- Case Type: Positive
-- Test Focus: binding_indication using only generic_map mapping without port_map — in the configuration specification the entity_aspect is followed by a generic map clause but no port map clause, verifies generic map and port map in binding_indication are both independently optional, generic map can appear alone without port map
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pipeline_reg is
  generic(width : positive := 8);
  port(clk : in bit; din : in bit_vector(width-1 downto 0); dout : out bit_vector(width-1 downto 0));
end entity pipeline_reg;

architecture rtl of pipeline_reg is
begin
end architecture rtl;


entity scs_syn8_ent is
  port(clk : in bit; d : in bit_vector(7 downto 0); q : out bit_vector(7 downto 0));
end entity scs_syn8_ent;

architecture rtl of scs_syn8_ent is
  component pipeline_reg is
    generic(width : positive := 8);
    port(clk : in bit; din : in bit_vector(width-1 downto 0); dout : out bit_vector(width-1 downto 0));
  end component pipeline_reg;
  for u_pipe : pipeline_reg use entity work.pipeline_reg(rtl)
    generic map(width => 8);
  end for;
begin
  u_pipe : pipeline_reg
    generic map(width => 8)
    port map(clk => clk, din => d, dout => q);
end architecture rtl;
