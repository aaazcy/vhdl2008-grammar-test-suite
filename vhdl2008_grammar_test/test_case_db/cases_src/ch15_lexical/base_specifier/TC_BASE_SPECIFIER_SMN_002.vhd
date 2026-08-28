-- =============================================================
-- Case ID: TC_BASE_SPECIFIER_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASE_SPECIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: base_specifier ::= B | O | X | UB | UO | UX | SB | SO | SX | D
-- Case Type: Negative
-- Test Focus: bit string content of base_specifier X contains a non-hexadecimal character(X"AG") — 'G' is outside the hexadecimal range of 0-9 or A-F, verify semantic analysis detects specifier X incompatible with bit value G
-- Expected Result: Triggers semantic error on hex digit out of range
-- Dependencies: None
-- =============================================================
entity bsp_hex_digit_error is
  port (
    bad_val : out bit_vector(7 downto 0)
  );
end entity bsp_hex_digit_error;

architecture rtl of bsp_hex_digit_error is
  constant C_BAD : bit_vector(7 downto 0) := X"AG";
begin
  bad_val <= C_BAD;
end architecture rtl;
