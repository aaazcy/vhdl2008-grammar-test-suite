-- =============================================================
-- Case ID: TC_BASIC_GRAPHIC_CHARACTER_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASIC_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_graphic_character ::= upper_case_letter | digit | special_character | space_character
-- Case Type: Negative
-- Test Focus: basic_graphic_character assignment type mismatch — character '0' (digit class graphic character) assigned to integer, but integer expects a numeric literal rather than a character literal; verify the semantic type check rejects it
-- Expected Result: Triggers semantic error on char-to-integer mismatch
-- Dependencies: None
-- =============================================================
entity bgc_char_digit_to_int is
  port (
    bad_val : out integer
  );
end entity bgc_char_digit_to_int;

architecture rtl of bgc_char_digit_to_int is
  constant C_BAD : integer := '0';
begin
  bad_val <= C_BAD;
end architecture rtl;
