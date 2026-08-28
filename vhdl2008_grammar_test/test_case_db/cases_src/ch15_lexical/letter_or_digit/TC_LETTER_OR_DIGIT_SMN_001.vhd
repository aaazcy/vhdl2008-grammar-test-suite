-- =============================================================
-- Case ID: TC_LETTER_OR_DIGIT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_LETTER_OR_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter_or_digit ::= letter | digit
-- Case Type: Negative
-- Test Focus: Trailing underscore leaves letter_or_digit missing — underscore must be followed by letter_or_digit, it cannot end an identifier
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity lod_smn_001 is
  port (
    val_out : out integer
  );
end entity lod_smn_001;

architecture rtl of lod_smn_001 is
  signal bad_end_ : integer := 0;
begin
  bad_end_ <= 5;
  val_out  <= bad_end_;
end architecture rtl;
