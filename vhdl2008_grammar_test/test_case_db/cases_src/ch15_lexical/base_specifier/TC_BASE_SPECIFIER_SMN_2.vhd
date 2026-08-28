-- =============================================================
-- Case ID: TC_BASE_SPECIFIER_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASE_SPECIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: base_specifier ::= B | O | X | UB | UO | UX | SB | SO | SX | D
-- Case Type: Negative
-- Test Focus: bit string content of base_specifier B contains a non-binary character(B"1021") — '2' is outside the binary digit range of 0 or 1, verify semantic analysis detects the specifier mismatching the bit string content
-- Expected Result: Triggers semantic error on binary digit out of range
-- Dependencies: None
-- =============================================================
entity bsp_binary_digit_error is
  port (
    bad_val : out bit_vector(3 downto 0)
  );
end entity bsp_binary_digit_error;

architecture rtl of bsp_binary_digit_error is
  constant C_BAD : bit_vector(3 downto 0) := B"1021";
begin
  bad_val <= C_BAD;
end architecture rtl;
