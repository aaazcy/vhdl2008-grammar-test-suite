-- =============================================================
-- Case ID: TC_BASE_SPECIFIER_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASE_SPECIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: base_specifier ::= B | O | X | UB | UO | UX | SB | SO | SX | D
-- Case Type: Positive
-- Test Focus: base_specifier used in bit string logic expressions and concatenation operations: B"11110000" xor X"0F" and UB"1111" & SB"0000", verify bit strings with specifiers can participate normally in logic/concatenation operations
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bsp_in_expressions is
  port (
    xor_out : out bit_vector(7 downto 0);
    cat_out : out bit_vector(7 downto 0)
  );
end entity bsp_in_expressions;

architecture rtl of bsp_in_expressions is
begin
  xor_out <= B"11110000" xor X"0F";
  cat_out <= UB"1111" & SB"0000";
end architecture rtl;
