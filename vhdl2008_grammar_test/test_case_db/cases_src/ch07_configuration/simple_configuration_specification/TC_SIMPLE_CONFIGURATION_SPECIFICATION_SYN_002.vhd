-- =============================================================
-- Case ID: TC_SIMPLE_CONFIGURATION_SPECIFICATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: simple_configuration_specification ::= for component_specification binding_indication [ ; ] end for [ ; ]
-- Case Type: Positive
-- Test Focus: Full binding with generic_map and port_map, explicit end for with trailing semicolons — exercises all optional elements [;] and end for [;]
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity data_reg is
  generic(width : positive := 8; rst_val : bit_vector(7 downto 0) := X"00");
  port(clk, rst : in bit; d : in bit_vector(width-1 downto 0); q : out bit_vector(width-1 downto 0));
end entity data_reg;

architecture beh of data_reg is
begin
end architecture beh;


entity scs_syn2_ent is
  port(clk, rst : in bit; din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity scs_syn2_ent;

architecture beh of scs_syn2_ent is
  component data_reg is
    generic(width : positive := 8; rst_val : bit_vector(7 downto 0) := X"00");
    port(clk, rst : in bit; d : in bit_vector(width-1 downto 0); q : out bit_vector(width-1 downto 0));
  end component data_reg;
  for u_reg : data_reg use entity work.data_reg(beh)
    generic map(width => 8, rst_val => X"00")
    port map(clk => clk, rst => rst, d => din, q => dout);
  end for;
begin
  u_reg : data_reg
    generic map(width => 8)
    port map(clk => clk, rst => rst, d => din, q => dout);
end architecture beh;
