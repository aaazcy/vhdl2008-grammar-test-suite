-- =============================================================
-- Case ID: TC_BASED_INTEGER_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASED_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_integer ::= extended_digit { [ underline ] extended_digit }
-- Case Type: Negative
-- Test Focus: SMN: digit beyond the base in based_integer — in 2#102# the base is 2 but digit 2 appears, every extended_digit of based_integer must be less than the base
-- Expected Result: Triggers analysis error: digit beyond base
-- Dependencies: None
-- =============================================================
entity based_int_bad_digit is
  port (
    y : out integer
  );
end entity based_int_bad_digit;

architecture vhdl2008 of based_int_bad_digit is
  constant C_BAD : integer := 2#102#;
begin
  y <= 0;
end architecture vhdl2008;
