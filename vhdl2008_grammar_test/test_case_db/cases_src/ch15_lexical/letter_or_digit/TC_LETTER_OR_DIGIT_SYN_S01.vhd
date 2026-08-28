-- =============================================================
-- Case ID: TC_LETTER_OR_DIGIT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: LETTER_OR_DIGIT
-- IEEE Section: 15.3
-- BNF Text: letter_or_digit ::= letter | digit
-- Test Focus: Letters used as body characters in a basic identifier after the first character
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity letter_or_digit_syn_s01 is
  port (
    addr_in  : in  bit_vector(7 downto 0);
    data_in  : in  bit_vector(15 downto 0);
    data_out : out bit_vector(15 downto 0)
  );
end entity letter_or_digit_syn_s01;

architecture rtl of letter_or_digit_syn_s01 is
  -- Identifier bodies use letter_or_digit characters (letters after first char)
  constant MEMORY_BASE_ADDR  : bit_vector(7 downto 0) := X"00";
  signal memory_data_buffer  : bit_vector(15 downto 0);
  signal writeback_register  : bit_vector(15 downto 0);
begin
  memory_data_buffer <= data_in when addr_in = MEMORY_BASE_ADDR else
                        writeback_register;
  writeback_register <= memory_data_buffer;
  data_out <= writeback_register;
end architecture rtl;
