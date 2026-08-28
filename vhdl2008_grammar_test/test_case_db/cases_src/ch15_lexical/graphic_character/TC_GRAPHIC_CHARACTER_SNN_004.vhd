-- =============================================================
-- Case ID: TC_GRAPHIC_CHARACTER_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_GRAPHIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: graphic_character ::= basic_graphic_character | lower_case_letter | other_special_character
-- Case Type: Negative
-- Test Focus: Backslash \ as graphic_character in an ordinary string — \ is legal in a string but has special meaning in some contexts
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity gc_snn_004 is
  port (
    val_out : out integer
  );
end entity gc_snn_004;

architecture rtl of gc_snn_004 is
  constant C_BAD : string(1 to 3) := "\";
begin
  val_out <= 0;
end architecture rtl;
