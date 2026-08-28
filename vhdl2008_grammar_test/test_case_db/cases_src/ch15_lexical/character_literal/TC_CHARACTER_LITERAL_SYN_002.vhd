-- =============================================================
-- Case ID: TC_CHARACTER_LITERAL_SYN_002
-- Rule Type: Syntax
-- BNF Production: CHARACTER_LITERAL
-- IEEE Section: 15.6
-- BNF Text: character_literal ::= ' graphic_character '
-- Test Focus: Character literal used in an expression — comparing a signal to character literals 'A', 'B', 'C'
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity character_literal_syn_002 is
  port (
    char_in  : in  integer range 0 to 2;
    match_a  : out bit;
    match_b  : out bit;
    match_c  : out bit
  );
end entity character_literal_syn_002;

architecture bh of character_literal_syn_002 is
  -- Character literals used in enumeration type for opcodes
  type t_sel is ('A', 'B', 'C');
  signal s_sel : t_sel;
begin
  -- Convert integer input to character selection
  s_sel <= 'A' when char_in = 0 else
           'B' when char_in = 1 else
           'C';
  match_a <= '1' when s_sel = 'A' else '0';
  match_b <= '1' when s_sel = 'B' else '0';
  match_c <= '1' when s_sel = 'C' else '0';
end architecture bh;
