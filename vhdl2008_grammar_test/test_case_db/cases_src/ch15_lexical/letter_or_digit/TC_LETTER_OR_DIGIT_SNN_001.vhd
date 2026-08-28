-- =============================================================
-- Case ID: TC_LETTER_OR_DIGIT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LETTER_OR_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter_or_digit ::= letter | digit
-- Case Type: Negative
-- Test Focus: Identifier containing the special character # — # is neither a letter nor a digit, violating the letter_or_digit definition
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity lod_snn_001 is
  port (
    val_out : out integer
  );
end entity lod_snn_001;

architecture rtl of lod_snn_001 is
  signal bad#sig : integer := 0;
begin
  bad#sig  <= 5;
  val_out <= bad#sig;
end architecture rtl;
