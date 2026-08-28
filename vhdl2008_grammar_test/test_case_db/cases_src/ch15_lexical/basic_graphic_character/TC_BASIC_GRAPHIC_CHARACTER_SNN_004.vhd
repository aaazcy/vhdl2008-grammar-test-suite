-- =============================================================
-- Case ID: TC_BASIC_GRAPHIC_CHARACTER_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_graphic_character ::= upper_case_letter | digit | special_character | space_character
-- Case Type: Negative
-- Test Focus: control character NUL (null character) appearing in basic_graphic_character in place of a graphic character — NUL is neither a format_effector nor a graphic_character, verify lexical analysis detects the illegal non-graphic character in the character literal
-- Expected Result: Triggers syntax error on non-graphic character
-- Dependencies: None
-- =============================================================
entity bgc_null_char is
  port (
    bad_val : out character
  );
end entity bgc_null_char;

architecture rtl of bgc_null_char is
  constant C_BAD : character := '';
begin
  bad_val <= C_BAD;
end architecture rtl;
