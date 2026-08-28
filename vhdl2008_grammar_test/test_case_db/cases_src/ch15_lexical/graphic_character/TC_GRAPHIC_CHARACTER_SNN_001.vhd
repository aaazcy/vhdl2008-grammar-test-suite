-- =============================================================
-- Case ID: TC_GRAPHIC_CHARACTER_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: graphic_character ::= basic_graphic_character | lower_case_letter | other_special_character
-- Case Type: Negative
-- Test Focus: Control character (NUL) inserted into a string — control characters are not graphic_character, VHDL lexical analysis should reject it
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity gc_snn_001 is
  port (
    val_out : out integer
  );
end entity gc_snn_001;

architecture rtl of gc_snn_001 is
  constant C_BAD : integer := '^@';  -- NUL control character is not a graphic_character
begin
  val_out <= C_BAD;
end architecture rtl;
