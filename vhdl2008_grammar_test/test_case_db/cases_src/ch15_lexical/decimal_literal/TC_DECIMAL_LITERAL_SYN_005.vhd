-- =============================================================
-- Case ID: TC_DECIMAL_LITERAL_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_DECIMAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.1
-- Production: decimal_literal ::= integer [ . integer ] [ exponent ]
-- Case Type: Positive
-- Test Focus: decimal_literal with only integer and exponent(integer exponent) used for large-range physical quantities, skipping the fractional part
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity dec_lit_int_exp is
  port (
    mega_val : out real;
    kilo_val : out real
  );
end entity dec_lit_int_exp;

architecture rtl of dec_lit_int_exp is
  constant C_MEGA : real := 1.0E6;
  constant C_KILO : real := 5.0E3;
  constant C_MILLI : real := 2.0E-3;
  signal s_sum    : real := 0.0;
begin
  s_sum    <= C_MEGA + C_KILO + C_MILLI;
  mega_val <= s_sum;
  kilo_val <= C_KILO;
end architecture rtl;
