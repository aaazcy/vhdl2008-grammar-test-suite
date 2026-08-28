-- =============================================================
-- Case ID: TC_BIT_VALUE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BIT_VALUE
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_value ::= graphic_character { [ underline ] graphic_character }
-- Case Type: Positive
-- Test Focus: bit_value all-0 and all-1 sequences(B"00000000", B"11111111") — verify the legality of the two extreme values in the longest continuous underscore-free sequence
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bv_extreme_values is
  port (
    lo : out bit_vector(7 downto 0);
    hi : out bit_vector(7 downto 0)
  );
end entity bv_extreme_values;

architecture rtl of bv_extreme_values is
  constant C_ZERO : bit_vector(7 downto 0) := B"00000000";
  constant C_ONES : bit_vector(7 downto 0) := B"11111111";
begin
  lo <= C_ZERO;
  hi <= C_ONES;
end architecture rtl;
