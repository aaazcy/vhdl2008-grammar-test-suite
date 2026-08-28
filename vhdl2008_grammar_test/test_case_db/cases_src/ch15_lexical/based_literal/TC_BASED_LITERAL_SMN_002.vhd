-- =============================================================
-- Case ID: TC_BASED_LITERAL_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASED_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_literal ::= base # based_integer [ . based_integer ] # [ exponent ]
-- Case Type: Negative
-- Test Focus: extended_digit of the integer and fractional parts in based_literal contains a character beyond the base(in 8#8#, base 8 allows 0-7 but the integer part uses 8): verify semantic analysis detects the based_integer digit beyond the base range
-- Expected Result: Triggers semantic error on digit exceeding base
-- Dependencies: None
-- =============================================================
entity bl_octal_digit_err is
  port (
    bad_val : out integer
  );
end entity bl_octal_digit_err;

architecture rtl of bl_octal_digit_err is
  constant C_BAD : integer := 8#8#;
begin
  bad_val <= C_BAD;
end architecture rtl;
