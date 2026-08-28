-- =============================================================
-- Case ID: TC_BASED_INTEGER_SNN_002
-- Rule Type: Syntax
-- BNF Production: BASED_INTEGER
-- IEEE Section: 15.5.3
-- BNF Text: based_integer ::= extended_digit { [ underline ] extended_digit }
-- Test Focus: Invalid extended digit 'G' in hex based integer — 'G' exceeds hex digit range (0-9, A-F)
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity based_integer_snn_002 is
  port (
    val_out : out bit_vector(7 downto 0)
  );
end entity based_integer_snn_002;

architecture bh of based_integer_snn_002 is
  -- ERROR: 'G' is not a valid extended_digit for hexadecimal (max is 'F')
  constant C_INVALID : bit_vector(7 downto 0) := X"FG";
begin
  val_out <= C_INVALID;
end architecture bh;
