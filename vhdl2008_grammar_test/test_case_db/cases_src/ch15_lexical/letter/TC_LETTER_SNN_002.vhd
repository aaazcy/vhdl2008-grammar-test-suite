-- =============================================================
-- Case ID: TC_LETTER_SNN_002
-- Rule Type: Syntax
-- BNF Production: LETTER
-- IEEE Section: 15.3
-- BNF Text: letter ::= upper_case_letter | lower_case_letter
-- Test Focus: Identifier starting with a digit instead of a letter — first character must be a letter
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity letter_snn_002 is
  port (
    data_in  : in  bit_vector(7 downto 0);
    data_out : out bit_vector(7 downto 0)
  );
end entity letter_snn_002;

architecture rtl of letter_snn_002 is
  -- ERROR: basic_identifier must start with a letter, not a digit
  signal 7segment_data : bit_vector(7 downto 0);
begin
  7segment_data <= data_in;
  data_out <= 7segment_data;
end architecture rtl;
