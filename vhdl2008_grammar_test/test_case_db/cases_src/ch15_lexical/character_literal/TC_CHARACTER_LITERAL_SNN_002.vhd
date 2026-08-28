-- =============================================================
-- Case ID: TC_CHARACTER_LITERAL_SNN_002
-- Rule Type: Syntax
-- BNF Production: CHARACTER_LITERAL
-- IEEE Section: 15.6
-- BNF Text: character_literal ::= ' graphic_character '
-- Test Focus: Character literal with two characters between quotes — must have exactly one graphic_character
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity character_literal_snn_002 is
  port (
    flag_out : out bit
  );
end entity character_literal_snn_002;

architecture bh of character_literal_snn_002 is
  -- ERROR: character literal must contain exactly one graphic_character
  -- 'AB' has two characters — this is a syntax error
  type t_bad is ('AB', 'CD');
  signal s_bad : t_bad := 'AB';
begin
  flag_out <= '1' when s_bad = 'AB' else '0';
end architecture bh;
