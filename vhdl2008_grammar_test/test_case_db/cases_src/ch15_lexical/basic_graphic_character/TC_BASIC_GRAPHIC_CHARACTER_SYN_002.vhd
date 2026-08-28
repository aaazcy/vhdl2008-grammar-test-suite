-- =============================================================
-- Case ID: TC_BASIC_GRAPHIC_CHARACTER_SYN_002
-- Rule Type: Syntax
-- BNF Production: BASIC_GRAPHIC_CHARACTER
-- IEEE Section: 15.2
-- BNF Text: basic_graphic_character ::= upper_case_letter | digit | special_character | space_character
-- Test Focus: Digits and special characters as basic_graphic_characters in string literals and character literals
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity basic_graphic_charac_syn_002 is
  port (
    seg_out : out bit_vector(6 downto 0)
  );
end entity basic_graphic_charac_syn_002;

architecture bh of basic_graphic_charac_syn_002 is
  -- Digits 0-9 are basic_graphic_characters (digit subclass)
  constant C_NUM_STR : string(1 to 5) := "0_1_2";
  -- Special characters + = * / are basic_graphic_characters
  -- Used in a string representing operators for documentation
  constant C_OPS_STR : string(1 to 5) := "+-*/=";
begin
  seg_out <= B"1111110";
end architecture bh;
