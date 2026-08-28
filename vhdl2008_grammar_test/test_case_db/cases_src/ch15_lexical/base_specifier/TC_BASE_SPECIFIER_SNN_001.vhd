-- =============================================================
-- Case ID: TC_BASE_SPECIFIER_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASE_SPECIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: base_specifier ::= B | O | X | UB | UO | UX | SB | SO | SX | D
-- Case Type: Negative
-- Test Focus: SNN: non-binary digit in a UB binary bit string — in UB"12" the UB denotes unsigned binary, bit values allow only 0/1, digit 2 is illegal
-- Expected Result: Triggers analysis error: invalid character in a binary bit string
-- Dependencies: None
-- =============================================================
entity bsp_ub_bad_digit is
  port (
    bad_val : out bit_vector(3 downto 0)
  );
end entity bsp_ub_bad_digit;

architecture vhdl2008 of bsp_ub_bad_digit is
  constant C_BAD : bit_vector(3 downto 0) := UB"12";
begin
  bad_val <= C_BAD;
end architecture vhdl2008;
