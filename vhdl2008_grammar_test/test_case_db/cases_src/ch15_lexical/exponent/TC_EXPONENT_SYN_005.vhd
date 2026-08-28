-- =============================================================
-- Case ID: TC_EXPONENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPONENT
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: exponent ::= E [ + ] integer | E - integer
-- Case Type: Positive
-- Test Focus: Multi-digit integer exponent and large-value exponent used for physical constants, verifying the exponent integer may exceed one digit
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity exp_multi_digit is
  port (
    large_val : out real;
    small_val : out real
  );
end entity exp_multi_digit;

architecture rtl of exp_multi_digit is
  constant C_LARGE   : real := 6.626E-34;
  constant C_SMALL   : real := 1.602E-19;
  constant C_GIGA    : real := 1.0E+12;
  signal s_ratio     : real := 0.0;
begin
  s_ratio   <= C_LARGE / C_SMALL;
  large_val <= C_GIGA;
  small_val <= s_ratio;
end architecture rtl;
