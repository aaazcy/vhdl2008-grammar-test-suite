-- =============================================================
-- Case ID: TC_EXTENDED_DIGIT_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_EXTENDED_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: extended_digit ::= digit | letter
-- Case Type: Negative
-- Test Focus: Letter G in a base-16 literal — G is a letter (legal extended_digit) but hexadecimal accepts only A-F, beyond the base-16 allowed range
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity ext_dig_sem_002 is
  port (
    val_out : out integer
  );
end entity ext_dig_sem_002;

architecture rtl of ext_dig_sem_002 is
  constant C_BAD : integer := 16#G1#;
begin
  val_out <= C_BAD;
end architecture rtl;
