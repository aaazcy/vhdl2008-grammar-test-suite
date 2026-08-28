-- =============================================================
-- Case ID: TC_BASIC_GRAPHIC_CHARACTER_SYN_S01
-- Rule Type: Syntax
-- BNF Production: BASIC_GRAPHIC_CHARACTER
-- IEEE Section: 15.2
-- BNF Text: basic_graphic_character ::= upper_case_letter | digit | special_character | space_character
-- Test Focus: Upper-case letters used as the starting character of basic identifiers for entity and signal names
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity basic_graphic_charac_syn_s01 is
  port (
    data_in  : in  bit_vector(3 downto 0);
    data_out : out bit_vector(3 downto 0)
  );
end entity basic_graphic_charac_syn_s01;

architecture bh of basic_graphic_charac_syn_s01 is
  -- All identifiers start with upper_case_letters (basic_graphic_character)
  signal REG_A : bit_vector(3 downto 0);
  signal REG_B : bit_vector(3 downto 0);
begin
  REG_A <= data_in;
  REG_B <= REG_A;
  data_out <= REG_B;
end architecture bh;
