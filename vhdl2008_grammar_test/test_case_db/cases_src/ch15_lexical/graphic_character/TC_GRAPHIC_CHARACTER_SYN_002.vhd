-- =============================================================
-- Case ID: TC_GRAPHIC_CHARACTER_SYN_002
-- Rule Type: Syntax
-- BNF Production: GRAPHIC_CHARACTER
-- IEEE Section: 15.2
-- BNF Text: graphic_character ::= basic_graphic_character | lower_case_letter | other_special_character
-- Test Focus: Special characters (!, #, $, %, &, etc.) as graphic_characters used in character and string literals
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity graphic_character_syn_002 is
  port (
    match_out : out bit
  );
end entity graphic_character_syn_002;

architecture bh of graphic_character_syn_002 is
  -- Special characters in a string literal for a debug message pattern
  constant C_DEBUG_TAG : string(1 to 8) := "DBG!@#$%";
  -- Character literal with special graphic character '#'
  type t_special is ('#', '$', '%');
  signal s_char : t_special := '#';
begin
  match_out <= '1' when s_char = '#' else '0';
end architecture bh;
