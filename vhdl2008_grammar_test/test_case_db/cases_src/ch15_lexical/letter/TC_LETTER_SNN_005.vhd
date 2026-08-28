-- =============================================================
-- Case ID: TC_LETTER_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LETTER
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter ::= upper_case_letter | lower_case_letter
-- Case Type: Negative
-- Test Focus: Character literal containing a non-letter character — a character literal may contain any graphic_character, but this tests the letter vs non-letter distinction
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity let_snn_005 is
  port (
    val_out : out integer
  );
end entity let_snn_005;

architecture rtl of let_snn_005 is
  signal @bad_sig : integer := 0;
begin
  @bad_sig <= 5;
  val_out   <= @bad_sig;
end architecture rtl;
