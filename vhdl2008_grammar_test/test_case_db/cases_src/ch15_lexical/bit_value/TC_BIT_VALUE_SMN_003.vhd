-- =============================================================
-- Case ID: TC_BIT_VALUE_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_BIT_VALUE
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_value ::= graphic_character { [ underline ] graphic_character }
-- Case Type: Negative
-- Test Focus: illegal graphic_character in bit_value — in O"38" digit '8' is beyond the octal 0-7 range: verify semantic analysis rejects the out-of-range digit under the octal specifier
-- Expected Result: Triggers semantic error on out-of-range octal digit
-- Dependencies: None
-- =============================================================
entity bv_octal_digit_err is
  port (
    bad_val : out bit_vector(5 downto 0)
  );
end entity bv_octal_digit_err;

architecture rtl of bv_octal_digit_err is
  constant C_BAD : bit_vector(5 downto 0) := O"38";
begin
  bad_val <= C_BAD;
end architecture rtl;
