-- =============================================================
-- Case ID: TC_BASIC_GRAPHIC_CHARACTER_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_graphic_character ::= upper_case_letter | digit | special_character | space_character
-- Case Type: Negative
-- Test Focus: SNN: character literal missing the closing single quote — in 'a there is only the opening single quote, a character literal must enclose one basic_graphic_character in a pair of single quotes
-- Expected Result: Triggers syntax error: unexpected token ''' in a primary
-- Dependencies: None
-- =============================================================
entity bgc_unterminated_char is
  port (
    bad_val : out character
  );
end entity bgc_unterminated_char;

architecture vhdl2008 of bgc_unterminated_char is
  constant C_BAD : character := 'a;
begin
  bad_val <= C_BAD;
end architecture vhdl2008;
