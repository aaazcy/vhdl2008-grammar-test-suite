-- =============================================================
-- Case ID: TC_LITERAL_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Negative
-- Test Focus: SNN — bit_string_literal with an illegal base specifier: 'D' in D"1010" is not a legal bit_string base (only B/O/X), the decimal base does not exist in bit_string
-- Expected Result: Triggers syntax error: invalid base specifier 'D' in bit_string_literal
-- Dependencies: None
-- =============================================================
entity lit_snn_004 is
  port (
    x : out bit_vector(3 downto 0)
  );
end entity lit_snn_004;

architecture invalid_bit_base of lit_snn_004 is
  -- ERROR: 'D' is not a valid base specifier for bit_string_literal (valid: B, O, X)
  constant C_BAD : bit_vector(3 downto 0) := D"1010";
begin
  x <= C_BAD;
end architecture invalid_bit_base;
