-- =============================================================
-- Case ID: TC_EXTENDED_DIGIT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTENDED_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: extended_digit ::= digit | letter
-- Case Type: Negative
-- Test Focus: Underscore directly adjacent to two extended_digits but as a separate token — underscore is allowed in a based integer but is not an extended_digit
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity ext_dig_snn_005 is
  port (
    val_out : out integer
  );
end entity ext_dig_snn_005;

architecture rtl of ext_dig_snn_005 is
  constant C_BAD : integer := 16#_A#;
begin
  val_out <= C_BAD;
end architecture rtl;
