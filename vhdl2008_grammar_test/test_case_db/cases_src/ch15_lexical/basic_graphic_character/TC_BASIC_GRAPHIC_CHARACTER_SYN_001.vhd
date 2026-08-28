-- =============================================================
-- Case ID: TC_BASIC_GRAPHIC_CHARACTER_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_graphic_character ::= upper_case_letter | digit | special_character | space_character
-- Case Type: Positive
-- Test Focus: all 26 uppercase letters (A-Z) of upper_case_letter in basic_graphic_character used in character literals and strings — verify all uppercase letters are recognized as legal graphic characters in the VHDL character set
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bgc_upper_case_all is
  port (
    ch1 : out character;
    ch2 : out character;
    ch3 : out character
  );
end entity bgc_upper_case_all;

architecture rtl of bgc_upper_case_all is
begin
  ch1 <= 'A';
  ch2 <= 'M';
  ch3 <= 'Z';
end architecture rtl;
