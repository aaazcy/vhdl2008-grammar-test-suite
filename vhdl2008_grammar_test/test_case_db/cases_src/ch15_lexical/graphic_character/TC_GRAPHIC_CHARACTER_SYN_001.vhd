-- =============================================================
-- Case ID: TC_GRAPHIC_CHARACTER_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: graphic_character ::= basic_graphic_character | lower_case_letter | other_special_character
-- Case Type: Positive
-- Test Focus: basic_graphic_character subset (uppercase letters and digits) used in string literals, verifying parsing of basic graphic characters
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity gc_basic_upper is
  port (
    msg_out : out string(1 to 10)
  );
end entity gc_basic_upper;

architecture rtl of gc_basic_upper is
  constant C_MSG : string(1 to 10) := "HELLO12345";
begin
  msg_out <= C_MSG;
end architecture rtl;
