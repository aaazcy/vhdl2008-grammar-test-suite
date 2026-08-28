-- =============================================================
-- Case ID: TC_CHARACTER_LITERAL_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHARACTER_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.6
-- Production: character_literal ::= ' graphic_character '
-- Case Type: Negative
-- Test Focus: character_literal containing two characters('AB') — exactly one graphic_character must be inside the single quotes, two characters in single quotes violate the BNF rule; verify the parser reports the character literal length as illegal
-- Expected Result: Triggers syntax error on two-char character literal
-- Dependencies: None
-- =============================================================
entity cl_two_chars is
  port (
    bad_val : out character
  );
end entity cl_two_chars;

architecture rtl of cl_two_chars is
  constant C_BAD : character := 'AB';
begin
  bad_val <= C_BAD;
end architecture rtl;
