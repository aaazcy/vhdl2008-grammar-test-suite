-- =============================================================
-- Case ID: TC_EXTENDED_DIGIT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTENDED_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: extended_digit ::= digit | letter
-- Case Type: Negative
-- Test Focus: Space character acting as extended_digit in a based literal — space is not a digit or letter, it must not be parsed as extended_digit
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity ext_dig_snn_004 is
  port (
    val_out : out integer
  );
end entity ext_dig_snn_004;

architecture rtl of ext_dig_snn_004 is
  constant C_BAD : integer := 16#A F#;
begin
  val_out <= C_BAD;
end architecture rtl;
