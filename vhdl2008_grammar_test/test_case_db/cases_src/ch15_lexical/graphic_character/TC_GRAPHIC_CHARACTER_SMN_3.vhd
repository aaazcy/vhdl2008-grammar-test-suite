-- =============================================================
-- Case ID: TC_GRAPHIC_CHARACTER_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: graphic_character ::= basic_graphic_character | lower_case_letter | other_special_character
-- Case Type: Negative
-- Test Focus: SEM: String literal composed of graphic_characters used in an integer context — in constant C_BAD : integer := "ab", "ab" is string type, mismatching type integer
-- Expected Result: Triggers analysis error: can't match string literal with type integer
-- Dependencies: None
-- =============================================================
entity gc_string_for_int is
  port (
    val_out : out integer
  );
end entity gc_string_for_int;

architecture vhdl2008 of gc_string_for_int is
  constant C_BAD : integer := "ab";
begin
  val_out <= 0;
end architecture vhdl2008;
