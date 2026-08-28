-- =============================================================
-- Case ID: TC_SLICE_NAME_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SLICE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: slice_name ::= prefix ( discrete_range )
-- Case Type: Positive
-- Test Focus: slice_name used on the left side (target) of an assignment——s_buf(3 downto 0) <= nibble uses the slice_name as an assignment target, verifying that a slice is not only readable but also writable
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity slice_lhs_assign is
  port(din : in bit_vector(7 downto 0);
       hi : in bit_vector(3 downto 0);
       lo : in bit_vector(3 downto 0);
       dout : out bit_vector(7 downto 0));
end entity;

architecture vhdl2008 of slice_lhs_assign is
  signal buf : bit_vector(7 downto 0) := (others => '0');
begin
  process(din, hi, lo)
  begin
    buf(7 downto 4) <= hi;
    buf(3 downto 0) <= lo;
  end process;
  dout <= buf;
end architecture vhdl2008;
