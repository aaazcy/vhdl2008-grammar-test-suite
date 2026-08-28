-- =============================================================
-- Case ID: TC_LETTER_OR_DIGIT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LETTER_OR_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter_or_digit ::= letter | digit
-- Case Type: Negative
-- Test Focus: SNN: identifier ending with a trailing underscore — in signal ab_ there is no letter_or_digit after the underscore, basic_identifier cannot end with an underscore
-- Expected Result: Triggers analysis error: an identifier cannot finish with '_'
-- Dependencies: None
-- =============================================================
entity lod_trailing_under is
  port (
    val_out : out integer
  );
end entity lod_trailing_under;

architecture vhdl2008 of lod_trailing_under is
  signal ab_ : integer;
begin
  val_out <= 0;
end architecture vhdl2008;
