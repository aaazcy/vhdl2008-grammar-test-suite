-- =============================================================
-- Case ID: TC_BASE_SPECIFIER_SYN_S01
-- Rule Type: Syntax
-- BNF Production: BASE_SPECIFIER
-- IEEE Section: 15.8
-- BNF Text: base_specifier ::= B | O | X | UB | UO | UX | SB | SO | SX | D
-- Test Focus: Base specifier B for binary in bit string literal
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity base_specifier_syn_s01 is
  port (
    bin_out : out bit_vector(7 downto 0)
  );
end entity base_specifier_syn_s01;

architecture bh of base_specifier_syn_s01 is
  -- B specifier for binary bit string literals
  constant C_BIN_LO : bit_vector(7 downto 0) := B"00000000";
  constant C_BIN_HI : bit_vector(7 downto 0) := B"11111111";
  signal s_result   : bit_vector(7 downto 0);
begin
  s_result <= C_BIN_LO or C_BIN_HI;
  bin_out  <= s_result;
end architecture bh;
