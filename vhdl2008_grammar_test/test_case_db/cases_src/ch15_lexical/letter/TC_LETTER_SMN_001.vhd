-- =============================================================
-- Case ID: TC_LETTER_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_LETTER
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter ::= upper_case_letter | lower_case_letter
-- Case Type: Negative
-- Test Focus: SMN: Identifier starting with a digit — in signal 2bad the first character of the identifier is a digit, basic_identifier must start with letter
-- Expected Result: Triggers analysis error: an identifier is expected instead of '<integer>'
-- Dependencies: None
-- =============================================================
entity letter_digit_led is
  port (
    val_out : out integer
  );
end entity letter_digit_led;

architecture vhdl2008 of letter_digit_led is
  signal 2bad : integer;
begin
  val_out <= 0;
end architecture vhdl2008;
