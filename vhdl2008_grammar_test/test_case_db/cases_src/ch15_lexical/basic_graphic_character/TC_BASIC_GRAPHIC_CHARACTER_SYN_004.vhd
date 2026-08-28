-- =============================================================
-- Case ID: TC_BASIC_GRAPHIC_CHARACTER_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_graphic_character ::= upper_case_letter | digit | special_character | space_character
-- Case Type: Positive
-- Test Focus: space_character of basic_graphic_character (space) appearing in the string "HELLO WORLD" — verify space_character parses legally in a string literal as a graphic character separating words
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bgc_space_in_string is
  port (
    msg : out string(1 to 11)
  );
end entity bgc_space_in_string;

architecture rtl of bgc_space_in_string is
  constant C_MSG : string(1 to 11) := "HELLO WORLD";
begin
  msg <= C_MSG;
end architecture rtl;
