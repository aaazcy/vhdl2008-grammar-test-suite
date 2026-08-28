-- =============================================================
-- Case ID: TC_BASE_SNN_002
-- Rule Type: Syntax
-- BNF Production: BASE
-- IEEE Section: 15.5.3
-- BNF Text: base ::= integer
-- Test Focus: Invalid base value 1 — base must be at least 2 (ERROR: 1#... is not a valid based literal)
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity base_snn_002 is
  port (
    val_out : out integer
  );
end entity base_snn_002;

architecture bh of base_snn_002 is
  -- ERROR: base 1 is invalid, integer base must be between 2 and 16
  constant C_INVALID : integer := 1#1010#;
begin
  val_out <= 42;
end architecture bh;
