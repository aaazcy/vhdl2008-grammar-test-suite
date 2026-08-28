-- =============================================================
-- Case ID: TC_BASED_INTEGER_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASED_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_integer ::= extended_digit { [ underline ] extended_digit }
-- Case Type: Negative
-- Test Focus: based_integer ending with an underscore(16#FF_#) — in the BNF rule underline must be followed by extended_digit, a trailing underscore violates the syntax; verify the parser reports a syntax error in a context expecting a digit after the trailing underscore
-- Expected Result: Triggers syntax error on trailing underscore
-- Dependencies: None
-- =============================================================
entity bi_trailing_underscore is
  port (
    bad_val : out integer
  );
end entity bi_trailing_underscore;

architecture rtl of bi_trailing_underscore is
  constant C_BAD : integer := 16#FF_#;
begin
  bad_val <= C_BAD;
end architecture rtl;
