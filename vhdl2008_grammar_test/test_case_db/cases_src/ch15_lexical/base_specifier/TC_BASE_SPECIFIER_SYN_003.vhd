-- =============================================================
-- Case ID: TC_BASE_SPECIFIER_SYN_003
-- Rule Type: Syntax
-- BNF Production: BASE_SPECIFIER
-- IEEE Section: 15.8
-- BNF Text: base_specifier ::= B | O | X | UB | UO | UX | SB | SO | SX | D
-- Test Focus: Unsigned (UB, UO, UX) and signed (SB, SO, SX) base specifiers for bit string literals
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity base_specifier_syn_003 is
  port (
    ub_out : out bit_vector(7 downto 0);
    uo_out : out bit_vector(8 downto 0);
    ux_out : out bit_vector(7 downto 0);
    sb_out : out bit_vector(7 downto 0);
    so_out : out bit_vector(8 downto 0);
    sx_out : out bit_vector(7 downto 0)
  );
end entity base_specifier_syn_003;

architecture bh of base_specifier_syn_003 is
  -- Unsigned binary bit string literal
  constant C_UB : bit_vector(7 downto 0) := UB"11111111";
  -- Unsigned octal bit string literal
  constant C_UO : bit_vector(8 downto 0) := UO"377";
  -- Unsigned hex bit string literal
  constant C_UX : bit_vector(7 downto 0) := UX"FF";
  -- Signed binary bit string literal
  constant C_SB : bit_vector(7 downto 0) := SB"11111111";
  -- Signed octal bit string literal
  constant C_SO : bit_vector(8 downto 0) := SO"377";
  -- Signed hex bit string literal
  constant C_SX : bit_vector(7 downto 0) := SX"FF";
begin
  ub_out <= C_UB;
  uo_out <= C_UO;
  ux_out <= C_UX;
  sb_out <= C_SB;
  so_out <= C_SO;
  sx_out <= C_SX;
end architecture bh;
