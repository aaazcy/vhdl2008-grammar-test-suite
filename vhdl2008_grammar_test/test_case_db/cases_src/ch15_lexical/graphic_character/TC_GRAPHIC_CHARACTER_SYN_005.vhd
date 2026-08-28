-- =============================================================
-- Case ID: TC_GRAPHIC_CHARACTER_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: graphic_character ::= basic_graphic_character | lower_case_letter | other_special_character
-- Case Type: Positive
-- Test Focus: All three classes of graphic_character mixed in strings, comprehensive coverage of uppercase, lowercase, digits and special symbols
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity gc_all_mixed is
  port (
    msg_out : out string(1 to 12)
  );
end entity gc_all_mixed;

architecture rtl of gc_all_mixed is
  constant C_MIX : string(1 to 12) := "VHDL 2008! @";
begin
  msg_out <= C_MIX;
end architecture rtl;
