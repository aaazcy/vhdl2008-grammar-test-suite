-- =============================================================
-- Case ID: TC_SLICE_NAME_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SLICE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: slice_name ::= prefix ( discrete_range )
-- Case Type: Positive
-- Test Focus: slice_name with consecutive multi-level slicing——s_buf(7 downto 0)(3 downto 0) first slices out 8 bits and then a 4-bit nibble, verifying that slice_name supports chained consecutive slice operations
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity slice_double_pipe is
  port(din : in bit_vector(15 downto 0);
       nibble_out : out bit_vector(3 downto 0));
end entity;

architecture vhdl2008 of slice_double_pipe is
  signal buf : bit_vector(15 downto 0) := (others => '0');
begin
  process(din)
  begin
    buf <= din;
    nibble_out <= buf(15 downto 8)(3 downto 0);
  end process;
end architecture vhdl2008;
