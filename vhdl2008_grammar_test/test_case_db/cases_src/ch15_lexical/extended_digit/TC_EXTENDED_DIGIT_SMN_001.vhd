-- =============================================================
-- Case ID: TC_EXTENDED_DIGIT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_EXTENDED_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: extended_digit ::= digit | letter
-- Case Type: Negative
-- Test Focus: Letter A appears in a base-2 literal — A is a legal extended_digit (letter) but semantically base-2 accepts only 0 and 1
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity ext_dig_smn_001 is
  port (
    val_out : out integer
  );
end entity ext_dig_smn_001;

architecture rtl of ext_dig_smn_001 is
  constant C_BAD : integer := 2#10A1#;
begin
  val_out <= C_BAD;
end architecture rtl;
