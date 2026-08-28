-- =============================================================
-- Case ID: TC_BASIC_GRAPHIC_CHARACTER_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_graphic_character ::= upper_case_letter | digit | special_character | space_character
-- Case Type: Positive
-- Test Focus: special_character class of basic_graphic_character — parentheses '(', ')', comma ',' and colon ':' used in character literal contexts: verify special characters are legal as a graphic character subclass
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bgc_special_paren_comma is
  port (
    lp : out character;
    rp : out character;
    cm : out character;
    cl : out character
  );
end entity bgc_special_paren_comma;

architecture rtl of bgc_special_paren_comma is
begin
  lp <= '(';
  rp <= ')';
  cm <= ',';
  cl <= ':';
end architecture rtl;
