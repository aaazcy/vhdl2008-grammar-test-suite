-- =============================================================
-- Case ID: TC_BINDING_INDICATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.2.1
-- Production: binding_indication ::= [ use entity_aspect ] [ generic_map_aspect ] [ port_map_aspect ]
-- Case Type: Positive
-- Test Focus: binding_indication with only generic_map_aspect — exercises the optionality of all three clauses: entity_aspect omitted and port_map_aspect omitted, with only the generic map providing new size/width values for the component binding
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity buf_reg is
  generic(DEPTH : integer := 8; WIDTH : integer := 4);
  port(d : in bit_vector(3 downto 0); q : out bit_vector(3 downto 0));
end entity buf_reg;

architecture rtl of buf_reg is
begin
end architecture rtl;


entity bi_generic_only is
  port(din : in bit_vector(3 downto 0); dout : out bit_vector(3 downto 0));
end entity;

architecture bh of bi_generic_only is
  component buf_reg is
    generic(DEPTH : integer := 8; WIDTH : integer := 4);
    port(d : in bit_vector(3 downto 0); q : out bit_vector(3 downto 0));
  end component;
  for u_buf : buf_reg use entity work.buf_reg(rtl)
    generic map(DEPTH => 16, WIDTH => 4);
  signal s_buf : bit_vector(3 downto 0) := "0000";
begin
  u_buf : buf_reg port map(d=>din, q=>dout);
end architecture bh;
