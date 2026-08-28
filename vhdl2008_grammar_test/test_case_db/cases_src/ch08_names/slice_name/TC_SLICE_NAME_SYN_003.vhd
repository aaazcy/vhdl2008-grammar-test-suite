-- =============================================================
-- Case ID: TC_SLICE_NAME_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SLICE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: slice_name ::= prefix ( discrete_range )
-- Case Type: Positive
-- Test Focus: slice_name descending slice——s_vec(7 downto 0) uses a descending discrete_range (downto direction), verifying that slice_name supports the range slice syntax in the downto direction
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity slice_desc_range is
  port(din : in bit_vector(7 downto 0);
       hi_nibble : out bit_vector(3 downto 0);
       lo_nibble : out bit_vector(3 downto 0));
end entity;

architecture vhdl2008 of slice_desc_range is
  signal buf : bit_vector(7 downto 0) := (others => '0');
begin
  process(din)
  begin
    buf <= din;
    hi_nibble <= buf(7 downto 4);
    lo_nibble <= buf(3 downto 0);
  end process;
end architecture vhdl2008;
