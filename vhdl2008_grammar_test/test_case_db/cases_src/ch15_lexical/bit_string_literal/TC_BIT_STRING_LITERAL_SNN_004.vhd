-- =============================================================
-- Case ID: TC_BIT_STRING_LITERAL_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BIT_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_string_literal ::= [ integer ] base_specifier " [ bit_value ] "
-- Case Type: Negative
-- Test Focus: bit_string_literal with length prefix 0(0B"1") — if the optional [ integer ] length prefix is zero the bit string is meaningless; verify the tool rejects the zero-width bit string or reports a semantic contradiction
-- Expected Result: Triggers error on zero-width prefix
-- Dependencies: None
-- =============================================================
entity bsl_zero_width is
  port (
    bad_val : out bit_vector(3 downto 0)
  );
end entity bsl_zero_width;

architecture rtl of bsl_zero_width is
  constant C_BAD : bit_vector(3 downto 0) := 0B"1";
begin
  bad_val <= C_BAD;
end architecture rtl;
