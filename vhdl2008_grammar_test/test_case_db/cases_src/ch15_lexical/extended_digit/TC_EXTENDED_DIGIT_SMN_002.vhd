-- =============================================================
-- Case ID: TC_EXTENDED_DIGIT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_EXTENDED_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: extended_digit ::= digit | letter
-- Case Type: Negative
-- Test Focus: Letter appears in a base-10 literal — although syntactically letter is a legal extended_digit, decimal base accepts only digits 0-9
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity ext_dig_smn_002 is
  port (
    val_out : out integer
  );
end entity ext_dig_smn_002;

architecture rtl of ext_dig_smn_002 is
  constant C_BAD : integer := 10#A5#;
begin
  val_out <= C_BAD;
end architecture rtl;
