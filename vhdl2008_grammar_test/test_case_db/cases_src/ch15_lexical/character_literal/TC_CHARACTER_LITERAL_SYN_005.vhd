-- =============================================================
-- Case ID: TC_CHARACTER_LITERAL_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHARACTER_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.6
-- Production: character_literal ::= ' graphic_character '
-- Case Type: Positive
-- Test Focus: character_literal used in enumeration type overloading and case statements — character literals 'R','G','B' as enumeration values identifying RGB channels: verify character_literal as enumeration literal is legal in user-defined contexts
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cl_as_enum_literals is
  port (
    sel : out integer
  );
end entity cl_as_enum_literals;

architecture rtl of cl_as_enum_literals is
  type t_color is ('R', 'G', 'B');
  signal s_color : t_color := 'R';
begin
  process(s_color)
  begin
    case s_color is
      when 'R' => sel <= 1;
      when 'G' => sel <= 2;
      when 'B' => sel <= 3;
    end case;
  end process;
end architecture rtl;
