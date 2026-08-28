-- =============================================================
-- Case ID: TC_EXPONENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPONENT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: exponent ::= E [ + ] integer | E - integer
-- Case Type: Positive
-- Test Focus: Exponent used with the integer part of a decimal_literal (no fraction), verifying E may directly follow integer to form a legal literal
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity exp_int_no_frac is
  port (
    val_out : out real
  );
end entity exp_int_no_frac;

architecture rtl of exp_int_no_frac is
  constant C_SPEED : real := 3.0E8;
  constant C_AVO   : real := 6022.0E20;
  signal s_val     : real := 0.0;
begin
  s_val   <= C_SPEED + C_AVO;
  val_out <= s_val;
end architecture rtl;
