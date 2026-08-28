-- =============================================================
-- Case ID: TC_BIT_STRING_LITERAL_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BIT_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_string_literal ::= [ integer ] base_specifier " [ bit_value ] "
-- Case Type: Positive
-- Test Focus: bit_string_literal with length prefix(8B"10101010") — the optional [ integer ] segment specifies the bit string width, verify the complete syntax of width prefix + base_specifier + bit string content
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bsl_with_width_prefix is
  port (
    b8  : out bit_vector(7 downto 0);
    h16 : out bit_vector(15 downto 0)
  );
end entity bsl_with_width_prefix;

architecture rtl of bsl_with_width_prefix is
  constant C_B8  : bit_vector(7 downto 0)  := 8B"10101010";
  constant C_H16 : bit_vector(15 downto 0) := 16X"ABCD";
begin
  b8  <= C_B8;
  h16 <= C_H16;
end architecture rtl;
