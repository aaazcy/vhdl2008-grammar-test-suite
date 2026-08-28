-- =============================================================
-- Case ID: TC_EXPONENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPONENT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: exponent ::= E [ + ] integer | E - integer
-- Case Type: Positive
-- Test Focus: Exponent of the form E+integer in a real literal, explicit plus sign tests the E [ + ] integer branch
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity exp_plus_int is
  port (
    val_out : out real
  );
end entity exp_plus_int;

architecture rtl of exp_plus_int is
  constant C_KILO : real := 2.0E+3;
  constant C_MEGA : real := 1.0E+6;
  signal s_result : real := 0.0;
begin
  s_result <= C_KILO + C_MEGA;
  val_out  <= s_result;
end architecture rtl;
