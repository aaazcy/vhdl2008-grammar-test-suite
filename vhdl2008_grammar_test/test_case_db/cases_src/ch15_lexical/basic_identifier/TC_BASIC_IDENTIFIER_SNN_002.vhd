-- =============================================================
-- Case ID: TC_BASIC_IDENTIFIER_SNN_002
-- Rule Type: Syntax
-- BNF Production: BASIC_IDENTIFIER
-- IEEE Section: 15.4.2
-- BNF Text: basic_identifier ::= letter { [ underline ] letter_or_digit }
-- Test Focus: Basic identifier starting with a digit is invalid — must start with a letter
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity basic_identifier_snn_002 is
  port (
    data_in  : in  bit_vector(7 downto 0);
    data_out : out bit_vector(7 downto 0)
  );
end entity basic_identifier_snn_002;

architecture rtl of basic_identifier_snn_002 is
  -- ERROR: identifier starting with a digit violates basic_identifier rule
  -- basic_identifier must start with a letter, not a digit
  signal 2bad_signal : bit_vector(7 downto 0);
begin
  2bad_signal <= data_in;
  data_out    <= 2bad_signal;
end architecture rtl;
