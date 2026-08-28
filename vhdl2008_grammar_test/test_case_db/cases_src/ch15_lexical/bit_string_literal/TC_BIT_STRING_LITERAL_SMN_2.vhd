-- =============================================================
-- Case ID: TC_BIT_STRING_LITERAL_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_BIT_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_string_literal ::= [ integer ] base_specifier " [ bit_value ] "
-- Case Type: Negative
-- Test Focus: SEM: illegal bit value in a B binary bit string — in B"2" the B denotes binary, bit_value allows only 0/1, digit 2 is illegal
-- Expected Result: Triggers analysis error: invalid character in a binary bit string
-- Dependencies: None
-- =============================================================
entity bsl_binary_bad_digit is
  port (
    bad_val : out bit_vector(3 downto 0)
  );
end entity bsl_binary_bad_digit;

architecture vhdl2008 of bsl_binary_bad_digit is
  constant C_BAD : bit_vector(3 downto 0) := B"2";
begin
  bad_val <= C_BAD;
end architecture vhdl2008;
