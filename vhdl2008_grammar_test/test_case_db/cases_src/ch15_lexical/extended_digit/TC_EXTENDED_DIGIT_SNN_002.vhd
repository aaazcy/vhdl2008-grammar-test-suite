-- =============================================================
-- Case ID: TC_EXTENDED_DIGIT_SNN_002
-- Rule Type: Syntax
-- BNF Production: EXTENDED_DIGIT
-- IEEE Section: 15.5.3
-- BNF Text: extended_digit ::= digit | letter
-- Test Focus: Invalid extended digit '@' — extended_digit must be a digit or a letter, '@' is neither
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity extended_digit_snn_002 is
  port (
    val_out : out integer
  );
end entity extended_digit_snn_002;

architecture bh of extended_digit_snn_002 is
  -- ERROR: '@' is neither a digit nor a letter — not a valid extended_digit
  constant C_BAD : integer := 16#FF@#;
begin
  val_out <= C_BAD;
end architecture bh;
