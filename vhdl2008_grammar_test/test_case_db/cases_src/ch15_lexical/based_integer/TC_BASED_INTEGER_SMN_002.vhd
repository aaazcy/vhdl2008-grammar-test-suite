-- =============================================================
-- Case ID: TC_BASED_INTEGER_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASED_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_integer ::= extended_digit { [ underline ] extended_digit }
-- Case Type: Negative
-- Test Focus: based_integer computed value beyond the integer range (2# followed by an extremely large 128-bit extended_digit sequence): verify semantic analysis detects the based_integer value overflowing integer'high
-- Expected Result: Triggers semantic error on integer overflow
-- Dependencies: None
-- =============================================================
entity bi_value_overflow is
  port (
    bad_val : out integer
  );
end entity bi_value_overflow;

architecture rtl of bi_value_overflow is
  constant C_BAD : integer := 2#1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111#;
begin
  bad_val <= C_BAD;
end architecture rtl;
