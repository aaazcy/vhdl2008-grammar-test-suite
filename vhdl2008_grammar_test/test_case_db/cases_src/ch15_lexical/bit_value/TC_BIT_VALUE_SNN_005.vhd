-- =============================================================
-- Case ID: TC_BIT_VALUE_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BIT_VALUE
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_value ::= graphic_character { [ underline ] graphic_character }
-- Case Type: Negative
-- Test Focus: bit_value with a trailing underscore(X"F_") — underline must be followed by a graphic_character, a trailing underscore violates the BNF; verify the parser fails expecting a following character when it hits the trailing underline
-- Expected Result: Triggers syntax error on trailing underscore
-- Dependencies: None
-- =============================================================
entity bv_trailing_us is
  port (
    bad_val : out bit_vector(3 downto 0)
  );
end entity bv_trailing_us;

architecture rtl of bv_trailing_us is
  constant C_BAD : bit_vector(3 downto 0) := X"F_";
begin
  bad_val <= C_BAD;
end architecture rtl;
