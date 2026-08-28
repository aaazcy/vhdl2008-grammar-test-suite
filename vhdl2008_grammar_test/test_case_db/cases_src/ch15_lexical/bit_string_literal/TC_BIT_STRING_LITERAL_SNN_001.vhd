-- =============================================================
-- Case ID: TC_BIT_STRING_LITERAL_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BIT_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_string_literal ::= [ integer ] base_specifier " [ bit_value ] "
-- Case Type: Negative
-- Test Focus: SNN: bit_string_literal missing the closing double quote — in B"1010 there is only the opening double quote, a bit string literal must enclose the bit value in a pair of double quotes
-- Expected Result: Triggers syntax error: bit string not terminated
-- Dependencies: None
-- =============================================================
entity bsl_unterminated is
  port (
    bad_val : out bit_vector(3 downto 0)
  );
end entity bsl_unterminated;

architecture vhdl2008 of bsl_unterminated is
  constant C_BAD : bit_vector(3 downto 0) := B"1010;
begin
  bad_val <= C_BAD;
end architecture vhdl2008;
