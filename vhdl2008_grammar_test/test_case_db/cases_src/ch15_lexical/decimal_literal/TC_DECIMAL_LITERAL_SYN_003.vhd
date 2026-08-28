-- =============================================================
-- Case ID: TC_DECIMAL_LITERAL_SYN_003
-- Rule Type: Syntax
-- BNF Production: DECIMAL_LITERAL
-- IEEE Section: 15.5.1
-- BNF Text: decimal_literal ::= integer [ . integer ] [ exponent ]
-- Test Focus: Decimal literals with exponent (E notation) — positive and negative exponents
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity decimal_literal_syn_003 is
  port (
    val_out : out real
  );
end entity decimal_literal_syn_003;

architecture bh of decimal_literal_syn_003 is
  -- Decimal literal with positive exponent (E+integer)
  constant C_LARGE   : real := 1.0E+9;
  -- Decimal literal with negative exponent (E-integer)
  constant C_SMALL   : real := 1.0E-9;
  -- Decimal literal with implicit positive exponent (E integer)
  constant C_IMPLICIT : real := 2.5E6;
  signal s_result     : real := 0.0;
begin
  s_result <= C_LARGE + C_SMALL + C_IMPLICIT;
  val_out  <= s_result;
end architecture bh;
