-- =============================================================
-- Case ID: TC_BASE_SPECIFIER_SNN_002
-- Rule Type: Syntax
-- BNF Production: BASE_SPECIFIER
-- IEEE Section: 15.8
-- BNF Text: base_specifier ::= B | O | X | UB | UO | UX | SB | SO | SX | D
-- Test Focus: Invalid base specifier Z — Z is not a valid bit string base specifier (ERROR)
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity base_specifier_snn_002 is
  port (
    val_out : out bit_vector(7 downto 0)
  );
end entity base_specifier_snn_002;

architecture bh of base_specifier_snn_002 is
  -- ERROR: "Z" is not a valid base_specifier token
  constant C_INVALID : bit_vector(7 downto 0) := Z"FF";
begin
  val_out <= C_INVALID;
end architecture bh;
