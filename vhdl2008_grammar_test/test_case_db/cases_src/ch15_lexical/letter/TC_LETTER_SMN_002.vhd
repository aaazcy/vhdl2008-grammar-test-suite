-- =============================================================
-- Case ID: TC_LETTER_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_LETTER
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter ::= upper_case_letter | lower_case_letter
-- Case Type: Negative
-- Test Focus: SMN: Identifier starting with underscore — in signal _ab the first character of the identifier is underscore, basic_identifier must start with letter, underscore may appear only between letters or digits
-- Expected Result: Triggers analysis error: an identifier can't start with '_'
-- Dependencies: None
-- =============================================================
entity letter_under_led is
  port (
    val_out : out integer
  );
end entity letter_under_led;

architecture vhdl2008 of letter_under_led is
  signal _ab : integer;
begin
  val_out <= 0;
end architecture vhdl2008;
