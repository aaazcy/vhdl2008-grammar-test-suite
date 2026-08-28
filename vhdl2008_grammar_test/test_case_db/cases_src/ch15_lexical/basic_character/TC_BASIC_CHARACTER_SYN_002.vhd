-- =============================================================
-- Case ID: TC_BASIC_CHARACTER_SYN_002
-- Rule Type: Syntax
-- BNF Production: BASIC_CHARACTER
-- IEEE Section: 15.2
-- BNF Text: basic_character ::= basic_graphic_character | format_effector
-- Test Focus: Basic characters (letters and digits) used in a string literal forming a 7-segment display pattern
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity basic_character_syn_002 is
  port (
    seg_out : out bit_vector(6 downto 0)
  );
end entity basic_character_syn_002;

architecture bh of basic_character_syn_002 is
  -- Basic characters in a string literal used as a ROM initialization pattern
  -- Each basic character (upper-case letters A-H) maps to a 7-segment display pattern
  constant C_SEG_PATTERNS : string(1 to 8) := "ABCDEFGH";
begin
  -- Output a fixed 7-segment pattern (pattern for '0')
  seg_out <= B"1111110";
end architecture bh;
