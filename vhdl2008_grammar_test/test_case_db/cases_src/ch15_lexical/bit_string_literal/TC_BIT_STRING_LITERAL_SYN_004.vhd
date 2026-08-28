-- =============================================================
-- Case ID: TC_BIT_STRING_LITERAL_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BIT_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: bit_string_literal ::= [ integer ] base_specifier " [ bit_value ] "
-- Case Type: Positive
-- Test Focus: bit_string_literal empty bit value form(X"") — the optional [ bit_value ] segment is empty, producing a zero-length bit string, verify the syntax of an empty bit value in a legal context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bsl_empty_value is
  port (
    r : out integer
  );
end entity bsl_empty_value;

architecture rtl of bsl_empty_value is
  constant C_EMPTY : string(1 to 0) := X"";
begin
  r <= 42;
end architecture rtl;
