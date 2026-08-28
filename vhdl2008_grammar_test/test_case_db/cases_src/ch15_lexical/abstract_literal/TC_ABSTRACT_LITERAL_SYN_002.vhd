-- =============================================================
-- Case ID: TC_ABSTRACT_LITERAL_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSTRACT_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5
-- Production: abstract_literal ::= decimal_literal | based_literal
-- Case Type: Positive
-- Test Focus: Use of decimal_literal real forms of abstract_literal in arithmetic expressions: reals with decimal point(3.14159, 0.001), reals with exponent(1.0e-10, 2.5E+3), pure integers(255, 0) as abstract_literal in multiplication/addition operations
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity al_real_arithmetic is
  port (
    prod_out : out real;
    sum_out  : out real
  );
end entity al_real_arithmetic;

architecture rtl of al_real_arithmetic is
  constant C_PI   : real := 3.14159;
  constant C_EPS  : real := 0.001;
  constant C_GAIN : real := 2.5E+3;
  constant C_TINY : real := 1.0e-10;
  constant C_SCALE: real := 255.0;
begin
  prod_out <= C_PI * C_GAIN;
  sum_out  <= C_EPS + C_TINY + C_SCALE;
end architecture rtl;
