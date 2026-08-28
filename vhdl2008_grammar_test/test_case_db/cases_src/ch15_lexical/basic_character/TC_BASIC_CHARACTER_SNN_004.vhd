-- =============================================================
-- Case ID: TC_BASIC_CHARACTER_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_character ::= basic_graphic_character | format_effector
-- Case Type: Negative
-- Test Focus: multiple characters in a basic_character character literal('AB') — a character literal must contain exactly one graphic_character, two characters inside single quotes violate the character literal syntax
-- Expected Result: Triggers syntax error on multi-char character literal
-- Dependencies: None
-- =============================================================
entity bc_multi_char is
  port (
    bad_val : out character
  );
end entity bc_multi_char;

architecture rtl of bc_multi_char is
  constant C_BAD : character := 'AB';
begin
  bad_val <= C_BAD;
end architecture rtl;
