-- =============================================================
-- Case ID: TC_EXPONENT_SNN_002
-- Rule Type: Syntax
-- BNF Production: EXPONENT
-- IEEE Section: 15.5.3
-- BNF Text: exponent ::= E [ + ] integer | E - integer
-- Test Focus: Invalid exponent — 'E' followed by a non-integer (decimal point) violates E [ + ] integer ｜ E - integer
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity exponent_snn_002 is
  port (
    val_out : out real
  );
end entity exponent_snn_002;

architecture bh of exponent_snn_002 is
  -- ERROR: exponent must be E followed by an integer, not E+.5 (decimal fraction)
  constant C_BAD : real := 1.0E0.5;
begin
  val_out <= C_BAD;
end architecture bh;
