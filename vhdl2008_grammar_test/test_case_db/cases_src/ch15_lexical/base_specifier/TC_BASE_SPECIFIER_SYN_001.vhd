-- =============================================================
-- Case ID: TC_BASE_SPECIFIER_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASE_SPECIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: base_specifier ::= B | O | X | UB | UO | UX | SB | SO | SX | D
-- Case Type: Positive
-- Test Focus: base_specifier D (decimal) as a width prefix in integer-based literals: D"255" denotes the bit string whose decimal equivalent value is 255, verify the syntactic correctness of D as a decimal base_specifier in bit string literals
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bsp_decimal_spec is
  port (
    dec_str : out bit_vector(7 downto 0)
  );
end entity bsp_decimal_spec;

architecture rtl of bsp_decimal_spec is
  constant C_DEC : bit_vector(7 downto 0) := D"255";
begin
  dec_str <= C_DEC;
end architecture rtl;
