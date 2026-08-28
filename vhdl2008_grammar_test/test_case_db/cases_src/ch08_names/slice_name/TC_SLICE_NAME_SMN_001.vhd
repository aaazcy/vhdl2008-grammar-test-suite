-- =============================================================
-- Case ID: TC_SLICE_NAME_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SLICE_NAME_002
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: slice_name ::= prefix ( discrete_range )
-- Case Type: Negative
-- Rule Description: The discrete_range bounds of a slice_name must not exceed the index range of the prefix
-- Error Category: Index out of range
-- Test Focus: SMN: slice bounds exceed the declared array range——in s_vec(9 downto 0), s_vec is declared as 7 downto 0, so 9 exceeds the declared range (0 to 7)
-- Expected Result: Triggers semantic/elaboration error (index out of range)
-- Dependencies: None
-- =============================================================
entity slice_out_of_range is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of slice_out_of_range is
  signal s_vec : bit_vector(7 downto 0) := (others => '0');
  signal bad_slice : bit_vector(9 downto 0);
begin
  -- ERROR: slice range 9 downto 0 exceeds vector bounds 7 downto 0
  bad_slice <= s_vec(9 downto 0);
  q <= d;
end architecture vhdl2008;
