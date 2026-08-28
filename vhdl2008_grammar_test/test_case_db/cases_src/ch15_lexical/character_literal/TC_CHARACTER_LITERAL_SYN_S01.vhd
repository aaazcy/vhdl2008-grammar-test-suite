-- =============================================================
-- Case ID: TC_CHARACTER_LITERAL_SYN_S01
-- Rule Type: Syntax
-- BNF Production: CHARACTER_LITERAL
-- IEEE Section: 15.6
-- BNF Text: character_literal ::= ' graphic_character '
-- Test Focus: Character literals '0' and '1' used as enumeration values for a std_logic-like type
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity character_literal_syn_s01 is
  port (
    input_bit  : in  bit;
    output_val : out integer
  );
end entity character_literal_syn_s01;

architecture bh of character_literal_syn_s01 is
  -- Character literals used as enumeration values
  type t_logic is ('0', '1', 'X', 'Z');
  signal s_a : t_logic := '0';
  signal s_b : t_logic := '1';
begin
  s_a <= '0' when input_bit = '0' else '1';
  s_b <= s_a;
  output_val <= 1 when s_b = '1' else 0;
end architecture bh;
