-- =============================================================
-- Case ID: TC_BASED_INTEGER_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASED_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_integer ::= extended_digit { [ underline ] extended_digit }
-- Case Type: Negative
-- Test Focus: extended_digit in based_integer beyond the radix allowed range(2#2#) — base 2 allows extended_digit only as 0 or 1, digit 2 is illegal in a binary context; verify semantic/lexical analysis rejects the out-of-range digit
-- Expected Result: Triggers semantic error on digit exceeding base
-- Dependencies: None
-- =============================================================
entity bi_digit_exceeds_base is
  port (
    bad_val : out integer
  );
end entity bi_digit_exceeds_base;

architecture rtl of bi_digit_exceeds_base is
  constant C_BAD : integer := 2#2#;
begin
  bad_val <= C_BAD;
end architecture rtl;
