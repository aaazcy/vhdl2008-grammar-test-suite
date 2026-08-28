-- =============================================================
-- Case ID: TC_BASE_SPECIFIER_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASE_SPECIFIER
-- Standard Reference: IEEE 1076-2008 Section 15.8
-- Production: base_specifier ::= B | O | X | UB | UO | UX | SB | SO | SX | D
-- Case Type: Positive
-- Test Focus: base_specifier used in contexts of different bit widths — 8-bit(B"10101010"), 12-bit(B"101010101010"), 16-bit(X"ABCD"): verify bit string length flexibility after base_specifier is independent of the specifier
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bsp_varying_widths is
  port (
    v8  : out bit_vector(7 downto 0);
    v12 : out bit_vector(11 downto 0);
    v16 : out bit_vector(15 downto 0)
  );
end entity bsp_varying_widths;

architecture rtl of bsp_varying_widths is
  constant C_B8  : bit_vector(7 downto 0)  := B"10101010";
  constant C_B12 : bit_vector(11 downto 0) := B"101010101010";
  constant C_X16 : bit_vector(15 downto 0) := X"ABCD";
begin
  v8  <= C_B8;
  v12 <= C_B12;
  v16 <= C_X16;
end architecture rtl;
