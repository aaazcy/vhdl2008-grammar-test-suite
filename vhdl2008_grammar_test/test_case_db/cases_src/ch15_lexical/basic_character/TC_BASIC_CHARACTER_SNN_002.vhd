-- =============================================================
-- Case ID: TC_BASIC_CHARACTER_SNN_002
-- Rule Type: Syntax
-- BNF Production: BASIC_CHARACTER
-- IEEE Section: 15.2
-- BNF Text: basic_character ::= basic_graphic_character | format_effector
-- Test Focus: SNN: character literal contains two characters — in 'ab' there are two basic_characters between the single quotes, a character literal allows exactly one character
-- Case Type: Negative
-- Expected Result: Triggers syntax error: unexpected token ''' in a primary
-- Dependencies: None
-- =============================================================
entity basic_character_two_chars is
  port (
    flag_out : out character
  );
end entity basic_character_two_chars;

architecture vhdl2008 of basic_character_two_chars is
  constant C_BAD : character := 'ab';
begin
  flag_out <= C_BAD;
end architecture vhdl2008;
