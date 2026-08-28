-- =============================================================
-- Case ID: TC_LETTER_OR_DIGIT_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_LETTER_OR_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter_or_digit ::= letter | digit
-- Case Type: Negative
-- Test Focus: SEM: Two consecutive underscores in an identifier — in signal a__b there is no letter_or_digit between the underscores, in basic_identifier underscore may only separate letters or digits
-- Expected Result: Triggers analysis error: two underscores can't be consecutive
-- Dependencies: None
-- =============================================================
entity lod_double_under is
  port (
    val_out : out integer
  );
end entity lod_double_under;

architecture vhdl2008 of lod_double_under is
  signal a__b : integer;
begin
  val_out <= 0;
end architecture vhdl2008;
