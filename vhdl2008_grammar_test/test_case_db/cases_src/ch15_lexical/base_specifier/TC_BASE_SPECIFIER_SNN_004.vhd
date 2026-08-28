-- =============================================================
-- Case ID: TC_BASE_SPECIFIER_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASE_SPECIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: base_specifier ::= B | O | X | UB | UO | UX | SB | SO | SX | D
-- Case Type: Negative
-- Test Focus: SNN: non-octal digit in an O octal bit string — in O"8" the O denotes octal, bit values allow only 0-7, digit 8 is illegal
-- Expected Result: Triggers analysis error: invalid character in a octal bit string
-- Dependencies: None
-- =============================================================
entity bsp_octal_bad_digit is
  port (
    bad_val : out bit_vector(3 downto 0)
  );
end entity bsp_octal_bad_digit;

architecture vhdl2008 of bsp_octal_bad_digit is
  constant C_BAD : bit_vector(3 downto 0) := O"8";
begin
  bad_val <= C_BAD;
end architecture vhdl2008;
