-- =============================================================
-- Case ID: TC_DECIMAL_LITERAL_SNN_002
-- Rule Type: Syntax
-- BNF Production: DECIMAL_LITERAL
-- IEEE Section: 15.5.1
-- BNF Text: decimal_literal ::= integer [ . integer ] [ exponent ]
-- Test Focus: Invalid decimal literal with two decimal points — only one decimal point is allowed
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity decimal_literal_snn_002 is
  port (
    val_out : out real
  );
end entity decimal_literal_snn_002;

architecture bh of decimal_literal_snn_002 is
  -- ERROR: double dot in decimal literal — at most one decimal point allowed
  constant C_BAD : real := 1.2.3;
begin
  val_out <= C_BAD;
end architecture bh;
