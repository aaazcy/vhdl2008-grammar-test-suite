-- =============================================================
-- Case ID: TC_BIT_VALUE_SYN_S01
-- Rule Type: Syntax
-- BNF Production: BIT_VALUE
-- IEEE Section: 15.8
-- BNF Text: bit_value ::= graphic_character { [ underline ] graphic_character }
-- Test Focus: Bit values 0 and 1 in a binary bit string literal driving a register
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bit_value_syn_s01 is
  port (
    bin_out : out bit_vector(7 downto 0)
  );
end entity bit_value_syn_s01;

architecture bh of bit_value_syn_s01 is
  -- Binary bit string literal with bit values 0 and 1
  constant C_ALL_ONES  : bit_vector(7 downto 0) := B"11111111";
  constant C_ALL_ZEROS : bit_vector(7 downto 0) := B"00000000";
  constant C_PATTERN   : bit_vector(7 downto 0) := B"10101010";
begin
  bin_out <= C_ALL_ONES xor C_PATTERN;
end architecture bh;
