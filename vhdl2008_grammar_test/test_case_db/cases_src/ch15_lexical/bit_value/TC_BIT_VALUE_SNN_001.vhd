-- =============================================================
-- Case ID: TC_BIT_VALUE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BIT_VALUE
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_value ::= graphic_character { [ underline ] graphic_character }
-- Case Type: Negative
-- Test Focus: bit_value starting with an underscore(B"_0") — underline can only appear between graphic_characters, not as the first character of bit_value; verify the parser rejects underscore-leading bit value sequences
-- Expected Result: Triggers syntax error on leading underscore
-- Dependencies: None
-- =============================================================
entity bv_leading_us is
  port (
    bad_val : out bit_vector(1 downto 0)
  );
end entity bv_leading_us;

architecture rtl of bv_leading_us is
  constant C_BAD : bit_vector(1 downto 0) := B"_0";
begin
  bad_val <= C_BAD;
end architecture rtl;
