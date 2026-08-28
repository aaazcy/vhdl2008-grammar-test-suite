-- =============================================================
-- Case ID: TC_LETTER_OR_DIGIT_SNN_002
-- Rule Type: Syntax
-- BNF Production: LETTER_OR_DIGIT
-- IEEE Section: 15.3
-- BNF Text: letter_or_digit ::= letter | digit
-- Test Focus: Invalid character '@' in an identifier body — letter_or_digit must be letter or digit, '@' is neither
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity letter_or_digit_snn_002 is
  port (
    data_in  : in  bit_vector(7 downto 0);
    data_out : out bit_vector(7 downto 0)
  );
end entity letter_or_digit_snn_002;

architecture rtl of letter_or_digit_snn_002 is
  -- ERROR: '@' is not a valid letter_or_digit character in a basic_identifier
  signal bad@signal : bit_vector(7 downto 0);
begin
  bad@signal <= data_in;
  data_out <= bad@signal;
end architecture rtl;
