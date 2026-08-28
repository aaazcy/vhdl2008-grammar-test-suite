-- =============================================================
-- Case ID: TC_BIT_VALUE_SYN_002
-- Rule Type: Syntax
-- BNF Production: BIT_VALUE
-- IEEE Section: 15.8
-- BNF Text: bit_value ::= graphic_character { [ underline ] graphic_character }
-- Test Focus: Bit values with underscores for readability in hex and binary bit string literals
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bit_value_syn_002 is
  port (
    hex_out : out bit_vector(15 downto 0);
    oct_out : out bit_vector(8 downto 0);
    bin_out : out bit_vector(7 downto 0)
  );
end entity bit_value_syn_002;

architecture bh of bit_value_syn_002 is
  -- Hex bit string with underscore grouping every 2 hex digits
  constant C_HEX : bit_vector(15 downto 0) := X"DE_AD";
  -- Octal bit string with underscore grouping
  constant C_OCT : bit_vector(8 downto 0) := O"7_77";
  -- Binary bit string with underscore nibble grouping
  constant C_BIN : bit_vector(7 downto 0) := B"1111_0000";
begin
  hex_out <= C_HEX;
  oct_out <= C_OCT;
  bin_out <= C_BIN;
end architecture bh;
