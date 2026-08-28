-- =============================================================
-- Case ID: TC_LETTER_OR_DIGIT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LETTER_OR_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter_or_digit ::= letter | digit
-- Case Type: Negative
-- Test Focus: Identifier containing a space as a separator — space is not letter_or_digit, its appearance inside an identifier causes token splitting
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity lod_snn_004 is
  port (
    val_out : out integer
  );
end entity lod_snn_004;

architecture rtl of lod_snn_004 is
  signal my sig : integer := 0;
begin
  my sig <= 5;
  val_out <= my sig;
end architecture rtl;
