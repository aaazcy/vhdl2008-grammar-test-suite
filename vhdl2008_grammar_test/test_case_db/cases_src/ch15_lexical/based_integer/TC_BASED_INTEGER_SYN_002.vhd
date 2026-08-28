-- =============================================================
-- Case ID: TC_BASED_INTEGER_SYN_002
-- Rule Type: Syntax
-- BNF Production: BASED_INTEGER
-- IEEE Section: 15.5.3
-- BNF Text: based_integer ::= extended_digit { [ underline ] extended_digit }
-- Test Focus: Based integer with underscore separators in hex, octal, and binary literals
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity based_integer_syn_002 is
  port (
    hex_out : out bit_vector(15 downto 0);
    oct_out : out bit_vector(8 downto 0);
    bin_out : out bit_vector(7 downto 0)
  );
end entity based_integer_syn_002;

architecture bh of based_integer_syn_002 is
  -- Hex with underscore byte grouping
  constant C_HEX : bit_vector(15 downto 0) := X"DE_AD";
  -- Octal with underscore grouping
  constant C_OCT : bit_vector(8 downto 0) := O"3_77";
  -- Binary with underscore nibble grouping
  constant C_BIN : bit_vector(7 downto 0) := B"1111_0000";
begin
  hex_out <= C_HEX;
  oct_out <= C_OCT;
  bin_out <= C_BIN;
end architecture bh;
