-- =============================================================
-- Case ID: TC_INSTANTIATION_LIST_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_INSTANTIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: instantiation_list ::= instantiation_label { , instantiation_label } | others | all
-- Case Type: Positive
-- Test Focus: instantiation_list with four comma-separated labels in a complex structural design -- exercises the { , instantiation_label } repetition to the extreme with four labels (u_b0, u_b1, u_b2, u_b3) sharing one configuration specification, testing that the parser handles arbitrarily long instantiation_label lists
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity buf_bit is
  port (a : in bit; y : out bit);
end entity buf_bit;

architecture rtl of buf_bit is
begin
end architecture rtl;

entity il_four_labels is
  port(
    din   : in  bit_vector(3 downto 0);
    dout  : out bit_vector(3 downto 0)
  );
end entity;

architecture structural of il_four_labels is
  component buf_bit is
    port(a : in bit; y : out bit);
  end component;

  -- instantiation_list with four labels
  for u_b0, u_b1, u_b2, u_b3 : buf_bit
    use entity work.buf_bit(rtl)
    port map(a => '0', y => open);

  signal bus_int : bit_vector(3 downto 0) := "0000";
begin
  u_b0 : buf_bit port map(a => din(0), y => bus_int(0));
  u_b1 : buf_bit port map(a => din(1), y => bus_int(1));
  u_b2 : buf_bit port map(a => din(2), y => bus_int(2));
  u_b3 : buf_bit port map(a => din(3), y => bus_int(3));
  dout <= bus_int;
end architecture structural;
