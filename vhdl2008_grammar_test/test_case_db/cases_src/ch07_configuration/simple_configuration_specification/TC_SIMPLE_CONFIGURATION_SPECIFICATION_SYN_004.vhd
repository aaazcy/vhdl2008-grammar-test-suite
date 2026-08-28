-- =============================================================
-- Case ID: TC_SIMPLE_CONFIGURATION_SPECIFICATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: simple_configuration_specification ::= for component_specification binding_indication [ ; ] end for [ ; ]
-- Case Type: Positive
-- Test Focus: Simple config spec using "all" and "others" in component_specification instantiation_list — binding configuration that covers multiple instances with a single specification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity d_flipflop is
  port (clk, d : in bit; q, qn : out bit);
end entity d_flipflop;

architecture rtl of d_flipflop is
begin
end architecture rtl;

entity scs_syn4_ent is
  port(clk : in bit; din : in bit_vector(3 downto 0); dout : out bit_vector(3 downto 0));
end entity scs_syn4_ent;

architecture rtl of scs_syn4_ent is
  component d_flipflop is
    port(clk, d : in bit; q, qn : out bit);
  end component d_flipflop;

  -- Bind all instances of d_flipflop to the same entity
  for all : d_flipflop use entity work.d_flipflop(rtl)
    port map(clk => clk, d => d, q => q, qn => qn);
  end for;

  signal s_d : bit_vector(3 downto 0);
  signal s_q : bit_vector(3 downto 0);
begin
  s_d <= din;
  u_ff0 : d_flipflop port map(clk => clk, d => s_d(0), q => s_q(0), qn => open);
  u_ff1 : d_flipflop port map(clk => clk, d => s_d(1), q => s_q(1), qn => open);
  u_ff2 : d_flipflop port map(clk => clk, d => s_d(2), q => s_q(2), qn => open);
  u_ff3 : d_flipflop port map(clk => clk, d => s_d(3), q => s_q(3), qn => open);
  dout <= s_q;
end architecture rtl;
