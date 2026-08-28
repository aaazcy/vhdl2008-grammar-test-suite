-- =============================================================
-- Case ID: TC_GRAPHIC_CHARACTER_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: graphic_character ::= basic_graphic_character | lower_case_letter | other_special_character
-- Case Type: Positive
-- Test Focus: other_special_character subset (! @ # $ % ^ & * etc.) in strings, verifying parsing of special symbols as graphic_character
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity gc_special_chars is
  port (
    msg_out : out string(1 to 8)
  );
end entity gc_special_chars;

architecture rtl of gc_special_chars is
  constant C_SPEC : string(1 to 8) := "!@#$%^&*";
begin
  msg_out <= C_SPEC;
end architecture rtl;
