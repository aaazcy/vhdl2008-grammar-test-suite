-- =============================================================
-- Case ID: TC_GRAPHIC_CHARACTER_SYN_S01
-- Rule Type: Syntax
-- BNF Production: GRAPHIC_CHARACTER
-- IEEE Section: 15.2
-- BNF Text: graphic_character ::= basic_graphic_character | lower_case_letter | other_special_character
-- Test Focus: Lower-case letters as graphic characters in identifiers — demonstrating lowercase letter support
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity graphic_character_syn_s01 is
  port (
    input_data  : in  bit_vector(7 downto 0);
    output_data : out bit_vector(7 downto 0)
  );
end entity graphic_character_syn_s01;

architecture rtl of graphic_character_syn_s01 is
  -- Identifiers using lower_case_letters (graphic_characters)
  signal byte_buffer    : bit_vector(7 downto 0);
  signal temp_register  : bit_vector(7 downto 0);
begin
  byte_buffer   <= input_data;
  temp_register <= byte_buffer;
  output_data   <= temp_register;
end architecture rtl;
