-- =============================================================
-- Case ID: TC_BASED_INTEGER_SYN_S01
-- Rule Type: Syntax
-- BNF Production: BASED_INTEGER
-- IEEE Section: 15.5.3
-- BNF Text: based_integer ::= extended_digit { [ underline ] extended_digit }
-- Test Focus: Based integer with hex extended digits A-F in a based literal
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity based_integer_syn_s01 is
  port (
    hex_out : out bit_vector(15 downto 0)
  );
end entity based_integer_syn_s01;

architecture bh of based_integer_syn_s01 is
  -- Based integers using extended digits A through F
  constant C_DEAD : bit_vector(15 downto 0) := X"DEAD";
  constant C_BEEF : bit_vector(15 downto 0) := X"BEEF";
  constant C_FACE : bit_vector(15 downto 0) := X"FACE";
begin
  hex_out <= C_DEAD xor C_BEEF xor C_FACE;
end architecture bh;
