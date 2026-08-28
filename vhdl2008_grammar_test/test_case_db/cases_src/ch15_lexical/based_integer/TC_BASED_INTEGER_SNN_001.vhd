-- =============================================================
-- Case ID: TC_BASED_INTEGER_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASED_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_integer ::= extended_digit { [ underline ] extended_digit }
-- Case Type: Negative
-- Test Focus: based_integer starting with an underscore(_FF) — the BNF rule requires starting with extended_digit, underscore cannot be the first character of based_integer; verify the parser rejects based_integer starting with underscore
-- Expected Result: Triggers syntax error on leading underscore
-- Dependencies: None
-- =============================================================
entity bi_leading_underscore is
  port (
    bad_val : out integer
  );
end entity bi_leading_underscore;

architecture rtl of bi_leading_underscore is
  constant C_BAD : integer := 16#_FF#;
begin
  bad_val <= C_BAD;
end architecture rtl;
