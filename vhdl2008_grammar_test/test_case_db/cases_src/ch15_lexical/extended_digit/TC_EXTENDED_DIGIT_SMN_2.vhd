-- =============================================================
-- Case ID: TC_EXTENDED_DIGIT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_EXTENDED_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: extended_digit ::= digit | letter
-- Case Type: Negative
-- Test Focus: Digit 8 used as extended_digit in a base-8 literal — syntactically 8 is a digit (legal extended_digit) but semantically beyond the allowed digit range of base-8
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity ext_dig_sem_001 is
  port (
    val_out : out integer
  );
end entity ext_dig_sem_001;

architecture rtl of ext_dig_sem_001 is
  constant C_BAD : integer := 8#88#;
begin
  val_out <= C_BAD;
end architecture rtl;
