-- =============================================================
-- Case ID: TC_GRAPHIC_CHARACTER_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: graphic_character ::= basic_graphic_character | lower_case_letter | other_special_character
-- Case Type: Negative
-- Test Focus: SMN: Character literal contains two graphic_characters — in constant C_BAD : character := 'ab' there are two characters between the single quotes, a character literal allows only one graphic_character
-- Expected Result: Triggers analysis error: unexpected token ''' in a primary
-- Dependencies: None
-- =============================================================
entity gc_two_char_literal is
  port (
    val_out : out character
  );
end entity gc_two_char_literal;

architecture vhdl2008 of gc_two_char_literal is
  constant C_BAD : character := 'ab';
begin
  val_out <= C_BAD;
end architecture vhdl2008;
