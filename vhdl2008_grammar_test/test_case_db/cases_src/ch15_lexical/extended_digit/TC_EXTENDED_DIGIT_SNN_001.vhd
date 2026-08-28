-- =============================================================
-- Case ID: TC_EXTENDED_DIGIT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTENDED_DIGIT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: extended_digit ::= digit | letter
-- Case Type: Negative
-- Test Focus: Special character @ as extended_digit in a based literal — @ is neither digit nor letter, violating the extended_digit definition
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity ext_dig_snn_001 is
  port (
    val_out : out integer
  );
end entity ext_dig_snn_001;

architecture rtl of ext_dig_snn_001 is
  constant C_BAD : integer := 16#A@#;
begin
  val_out <= C_BAD;
end architecture rtl;
