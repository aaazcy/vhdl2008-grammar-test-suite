-- =============================================================
-- Case ID: TC_BASED_LITERAL_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASED_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_literal ::= base # based_integer [ . based_integer ] # [ exponent ]
-- Case Type: Negative
-- Test Focus: based_literal with empty fractional part after the decimal point(16#A.#) — in the optional [ . based_integer ] segment the dot must be followed by at least one extended_digit, an empty fractional part leaves the syntax incomplete
-- Expected Result: Triggers syntax error on empty fractional part
-- Dependencies: None
-- =============================================================
entity bl_empty_fraction is
  port (
    bad_val : out integer
  );
end entity bl_empty_fraction;

architecture rtl of bl_empty_fraction is
  constant C_BAD : integer := 16#A.#;
begin
  bad_val <= C_BAD;
end architecture rtl;
