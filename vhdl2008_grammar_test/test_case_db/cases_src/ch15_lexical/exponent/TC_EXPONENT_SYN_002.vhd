-- =============================================================
-- Case ID: TC_EXPONENT_SYN_002
-- Rule Type: Syntax
-- BNF Production: EXPONENT
-- IEEE Section: 15.5.3
-- BNF Text: exponent ::= E [ + ] integer | E - integer
-- Test Focus: Negative exponent (E-integer) in real literal for small values
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity exponent_syn_002 is
  port (
    val_out : out real
  );
end entity exponent_syn_002;

architecture bh of exponent_syn_002 is
  -- Negative exponent (E-integer) for very small values
  constant C_NANO  : real := 1.0E-9;
  constant C_PICO  : real := 1.0E-12;
  constant C_MICRO : real := 1.0E-6;
  signal s_result  : real := 0.0;
begin
  s_result <= C_NANO + C_PICO + C_MICRO;
  val_out  <= s_result;
end architecture bh;
