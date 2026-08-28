-- =============================================================
-- Case ID: TC_GRAPHIC_CHARACTER_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: graphic_character ::= basic_graphic_character | lower_case_letter | other_special_character
-- Case Type: Positive
-- Test Focus: lower_case_letter subset (a-z) used in strings and comments, verifying lowercase letters are correctly recognized as graphic_character
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity gc_lower_letters is
  port (
    msg_out : out string(1 to 8)
  );
end entity gc_lower_letters;

architecture rtl of gc_lower_letters is
  constant C_LOWER : string(1 to 8) := "abcdefgh";
begin
  msg_out <= C_LOWER;
end architecture rtl;
