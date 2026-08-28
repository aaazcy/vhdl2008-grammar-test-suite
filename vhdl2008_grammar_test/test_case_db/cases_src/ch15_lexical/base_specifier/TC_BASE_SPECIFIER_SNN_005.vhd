-- =============================================================
-- Case ID: TC_BASE_SPECIFIER_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASE_SPECIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: base_specifier ::= B | O | X | UB | UO | UX | SB | SO | SX | D
-- Case Type: Negative
-- Test Focus: base_specifier with an illegal multi-character combination(UBB"1010") — UBB is not a legal specifier, legal forms are only 2-character UB, SB, etc.; verify the parser rejects illegal specifiers longer than 2 characters
-- Expected Result: Triggers syntax error on invalid multi-char specifier
-- Dependencies: None
-- =============================================================
entity bsp_invalid_ubb is
  port (
    bad_val : out bit_vector(3 downto 0)
  );
end entity bsp_invalid_ubb;

architecture rtl of bsp_invalid_ubb is
  constant C_BAD : bit_vector(3 downto 0) := UBB"1010";
begin
  bad_val <= C_BAD;
end architecture rtl;
