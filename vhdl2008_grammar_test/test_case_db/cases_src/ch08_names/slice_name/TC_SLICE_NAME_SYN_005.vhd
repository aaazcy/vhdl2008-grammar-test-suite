-- =============================================================
-- Case ID: TC_SLICE_NAME_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SLICE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: slice_name ::= prefix ( discrete_range )
-- Case Type: Positive
-- Test Focus: Single-element slice——s_vec(3 downto 3) uses a discrete_range with equal bounds to produce a slice of exactly one element, verifying that a slice degenerates validly to a single element when the bounds are equal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity slice_single_elem is
  port(din : in bit_vector(3 downto 0); bit3 : out bit);
end entity;

architecture vhdl2008 of slice_single_elem is
  signal buf : bit_vector(3 downto 0) := "0000";
begin
  process(din)
  begin
    buf <= din;
    bit3 <= buf(3 downto 3)(3);
  end process;
end architecture vhdl2008;
