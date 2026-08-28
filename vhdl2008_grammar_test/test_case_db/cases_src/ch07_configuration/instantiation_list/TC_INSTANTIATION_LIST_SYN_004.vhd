-- =============================================================
-- Case ID: TC_INSTANTIATION_LIST_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_INSTANTIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: instantiation_list ::= instantiation_label { , instantiation_label } | others | all
-- Case Type: Positive
-- Test Focus: instantiation_list with single label in configuration specification using generic map -- exercises "for u_reg : comp_name" where instantiation_list is a single instantiation_label, combined with a generic map binding in the component configuration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pipe_reg is
  generic(WIDTH : integer := 8);
  port(
      clock : in  bit;
      d     : in  bit_vector(WIDTH-1 downto 0);
      q     : out bit_vector(WIDTH-1 downto 0)
    );
end entity pipe_reg;

architecture rtl of pipe_reg is
begin
end architecture rtl;


entity il_single_generic is
  port(
    clk    : in  bit;
    din    : in  bit_vector(7 downto 0);
    dout   : out bit_vector(7 downto 0)
  );
end entity;

architecture structural of il_single_generic is
  component pipe_reg is
    generic(WIDTH : integer := 8);
    port(
      clock : in  bit;
      d     : in  bit_vector(WIDTH-1 downto 0);
      q     : out bit_vector(WIDTH-1 downto 0)
    );
  end component;

  -- instantiation_list: single label "u_reg" with generic map
  for u_reg : pipe_reg
    use entity work.pipe_reg(rtl)
    generic map(WIDTH => 8)
    port map(clock => clk, d => din, q => dout);

  signal d_buf : bit_vector(7 downto 0) := X"00";
begin
  u_reg : pipe_reg
    generic map(WIDTH => 8)
    port map(clock => clk, d => din, q => d_buf);
  dout <= d_buf;
end architecture structural;
