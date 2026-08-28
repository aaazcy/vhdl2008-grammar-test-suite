-- =============================================================
-- Case ID: TC_BASIC_GRAPHIC_CHARACTER_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASIC_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_graphic_character ::= upper_case_letter | digit | special_character | space_character
-- Case Type: Negative
-- Test Focus: length semantics of a basic_graphic_character character literal — two graphic characters 'AB' appear within single quotes, a character literal requires exactly one graphic_character; verify semantic analysis reports the character literal length as illegal
-- Expected Result: Triggers semantic error on two-character literal
-- Dependencies: None
-- =============================================================
entity bgc_two_char_literal is
  port (
    bad_val : out character
  );
end entity bgc_two_char_literal;

architecture rtl of bgc_two_char_literal is
  constant C_BAD : character := 'AB';
begin
  bad_val <= C_BAD;
end architecture rtl;
