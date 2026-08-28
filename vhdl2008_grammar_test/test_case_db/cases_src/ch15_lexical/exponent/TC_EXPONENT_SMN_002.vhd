-- =============================================================
-- Case ID: TC_EXPONENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_EXPONENT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: exponent ::= E [ + ] integer | E - integer
-- Case Type: Negative
-- Test Focus: SMN: Missing digits after E in exponent — in 1.0E no digits follow the exponent symbol, exponent must consist of E plus integer digits
-- Expected Result: Triggers analysis error: digit expected after exponent
-- Dependencies: None
-- =============================================================
entity exp_missing_digit is
  port (
    val_out : out real
  );
end entity exp_missing_digit;

architecture vhdl2008 of exp_missing_digit is
  constant C_BAD : real := 1.0E;
begin
  val_out <= 0.0;
end architecture vhdl2008;
