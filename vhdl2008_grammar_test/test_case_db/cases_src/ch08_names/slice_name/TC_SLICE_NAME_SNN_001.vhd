-- =============================================================
-- Case ID: TC_SLICE_NAME_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SLICE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.4
-- Production: slice_name ::= prefix ( discrete_range )
-- Case Type: Negative
-- Test Focus: SNN: missing left parenthesis——in s_vec 7 downto 0) the '(' between the prefix and the discrete_range is missing; a slice_name requires the discrete_range to be enclosed in parentheses
-- Expected Result: Triggers syntax error at missing '('
-- Dependencies: None
-- =============================================================
entity slice_miss_lparen is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of slice_miss_lparen is
  signal s_vec : bit_vector(7 downto 0) := (others => '0');
  signal result : bit_vector(3 downto 0) := (others => '0');
begin
  -- ERROR: Missing '(' before discrete_range
  result <= s_vec 7 downto 4);
  q <= result(0);
end architecture vhdl2008;
