-- =============================================================
-- Case ID: TC_BIT_STRING_LITERAL_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_BIT_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_string_literal ::= [ integer ] base_specifier " [ bit_value ] "
-- Case Type: Negative
-- Test Focus: bit_string_literal assigned to an incompatible type — X"FF" bit string literal assigned to an integer signal, the bit string is incompatible with the integer type; verify the semantic type check rejects it
-- Expected Result: Triggers semantic error on type incompatibility
-- Dependencies: None
-- =============================================================
entity bsl_type_mismatch is
  port (
    bad_val : out integer
  );
end entity bsl_type_mismatch;

architecture rtl of bsl_type_mismatch is
  constant C_BAD : integer := X"FF";
begin
  bad_val <= C_BAD;
end architecture rtl;
