-- =============================================================
-- Case ID: TC_INTEGER_SNN_002
-- Rule Type: Syntax
-- BNF Production: INTEGER
-- IEEE Section: 15.5.3
-- BNF Text: integer ::= digit { [ underline ] digit }
-- Test Focus: Invalid integer containing a decimal point — integer consists of digits only, not a decimal point
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity integer_snn_002 is
  port (
    val_out : out integer
  );
end entity integer_snn_002;

architecture bh of integer_snn_002 is
  -- ERROR: integer token cannot contain a decimal point
  -- This would be parsed as a decimal_literal, not a plain integer
  constant C_BAD : integer := 42.0;
begin
  val_out <= C_BAD;
end architecture bh;
