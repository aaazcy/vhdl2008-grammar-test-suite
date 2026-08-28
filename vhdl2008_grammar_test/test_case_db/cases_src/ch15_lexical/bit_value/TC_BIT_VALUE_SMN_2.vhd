-- =============================================================
-- Case ID: TC_BIT_VALUE_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_BIT_VALUE
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_value ::= graphic_character { [ underline ] graphic_character }
-- Case Type: Negative
-- Test Focus: bit_value graphic_character beyond the specifier allowed range(in X"FG", 'G' is not 0-9/A-F) — verify semantic analysis detects the illegal character in bit_value under the base_specifier X context
-- Expected Result: Triggers semantic error on out-of-range hex digit
-- Dependencies: None
-- =============================================================
entity bv_hex_digit_err is
  port (
    bad_val : out bit_vector(7 downto 0)
  );
end entity bv_hex_digit_err;

architecture rtl of bv_hex_digit_err is
  constant C_BAD : bit_vector(7 downto 0) := X"FG";
begin
  bad_val <= C_BAD;
end architecture rtl;
