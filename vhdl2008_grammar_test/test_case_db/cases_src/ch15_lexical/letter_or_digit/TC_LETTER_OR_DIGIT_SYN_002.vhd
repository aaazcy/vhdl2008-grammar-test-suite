-- =============================================================
-- Case ID: TC_LETTER_OR_DIGIT_SYN_002
-- Rule Type: Syntax
-- BNF Production: LETTER_OR_DIGIT
-- IEEE Section: 15.3
-- BNF Text: letter_or_digit ::= letter | digit
-- Test Focus: Digits used as body characters in a basic identifier (after the first character which must be a letter)
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity letter_or_digit_syn_002 is
  port (
    bus_addr_in   : in  bit_vector(15 downto 0);
    bus_data_in   : in  bit_vector(31 downto 0);
    bus_data_out  : out bit_vector(31 downto 0)
  );
end entity letter_or_digit_syn_002;

architecture rtl of letter_or_digit_syn_002 is
  -- Identifiers with digits in body: bus0_sel, reg32_data, addr16_latch
  signal reg32_stage1 : bit_vector(31 downto 0);
  signal reg32_stage2 : bit_vector(31 downto 0);
  constant ADDR16_MASK : bit_vector(15 downto 0) := X"FFF0";
begin
  reg32_stage1 <= bus_data_in when (bus_addr_in and ADDR16_MASK) = X"0000" else
                  reg32_stage2;
  reg32_stage2 <= reg32_stage1;
  bus_data_out <= reg32_stage2;
end architecture rtl;
