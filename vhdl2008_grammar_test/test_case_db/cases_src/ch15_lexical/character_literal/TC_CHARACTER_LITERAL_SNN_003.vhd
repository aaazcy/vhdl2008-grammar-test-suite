-- =============================================================
-- Case ID: TC_CHARACTER_LITERAL_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CHARACTER_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.6
-- Production: character_literal ::= ' graphic_character '
-- Case Type: Negative
-- Test Focus: character_literal: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity character_liter_e3 is end entity;
architecture bh of character_liter_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;