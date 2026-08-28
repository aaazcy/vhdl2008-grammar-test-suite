-- =============================================================
-- Case ID: TC_BIT_STRING_LITERAL_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_BIT_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_string_literal ::= [ integer ] base_specifier " [ bit_value ] "
-- Case Type: Negative
-- Test Focus: bit_value in bit_string_literal contains an illegal character(B"10X1") — 'X' is not a binary bit_value graphic character, verify semantic analysis rejects the out-of-range character in the base_specifier context
-- Expected Result: Triggers semantic error on invalid bit_value char
-- Dependencies: None
-- =============================================================
entity bsl_invalid_bit_char is
  port (
    bad_val : out bit_vector(3 downto 0)
  );
end entity bsl_invalid_bit_char;

architecture rtl of bsl_invalid_bit_char is
  constant C_BAD : bit_vector(3 downto 0) := B"10X1";
begin
  bad_val <= C_BAD;
end architecture rtl;
