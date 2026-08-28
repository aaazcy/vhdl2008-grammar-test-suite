-- =============================================================
-- Case ID: TC_BASED_INTEGER_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASED_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_integer ::= extended_digit { [ underline ] extended_digit }
-- Case Type: Positive
-- Test Focus: based_integer as the integer part of a based_literal with a decimal point(the AB part in 16#AB.CD#): verify the syntax of based_integer appearing between # and . as the integer part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bi_in_fractional is
  port (
    val : out real
  );
end entity bi_in_fractional;

architecture rtl of bi_in_fractional is
  constant C_FRAC : real := 16#AB.CD#;
begin
  val <= C_FRAC;
end architecture rtl;
