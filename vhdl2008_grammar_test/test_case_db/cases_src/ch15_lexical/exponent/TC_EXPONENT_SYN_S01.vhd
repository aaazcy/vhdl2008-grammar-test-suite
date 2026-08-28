-- =============================================================
-- Case ID: TC_EXPONENT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: EXPONENT
-- IEEE Section: 15.5.3
-- BNF Text: exponent ::= E [ + ] integer | E - integer
-- Test Focus: Positive exponent (E+integer) in real literal for scientific notation
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity exponent_syn_s01 is
  port (
    val_out : out real
  );
end entity exponent_syn_s01;

architecture bh of exponent_syn_s01 is
  -- Exponent with explicit positive sign (E+integer)
  constant C_MEGA : real := 1.0E+6;
  -- Exponent with implicit sign (E integer)
  constant C_KILO : real := 1.0E3;
  signal s_result : real := 0.0;
begin
  s_result <= C_MEGA + C_KILO;
  val_out  <= s_result;
end architecture bh;
