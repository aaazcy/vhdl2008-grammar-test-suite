-- =============================================================
-- Case ID: TC_LETTER_OR_DIGIT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_LETTER_OR_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.3
-- Production: letter_or_digit ::= letter | digit
-- Case Type: Negative
-- Test Focus: Identifier confused with a reserved word through case — END is a reserved word but end is formed from letter_or_digit with the exact same name, semantic check should reject it
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity lod_smn_002 is
  port (
    val_out : out integer
  );
end entity lod_smn_002;

architecture rtl of lod_smn_002 is
  signal End : integer := 0;
begin
  End     <= 5;
  val_out <= End;
end architecture rtl;
