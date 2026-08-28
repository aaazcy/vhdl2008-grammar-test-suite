-- =============================================================
-- Case ID: TC_BIT_VALUE_SNN_002
-- Rule Type: Syntax
-- BNF Production: BIT_VALUE
-- IEEE Section: 15.8
-- BNF Text: bit_value ::= graphic_character { [ underline ] graphic_character }
-- Test Focus: Invalid bit value character '2' in a binary bit string literal — only 0/1 valid for base B
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity bit_value_snn_002 is
  port (
    val_out : out bit_vector(3 downto 0)
  );
end entity bit_value_snn_002;

architecture bh of bit_value_snn_002 is
  -- ERROR: '2' is not a valid bit_value in a binary bit string literal
  -- Binary only accepts graphic characters 0 or 1
  constant C_INVALID : bit_vector(3 downto 0) := B"1021";
begin
  val_out <= C_INVALID;
end architecture bh;
