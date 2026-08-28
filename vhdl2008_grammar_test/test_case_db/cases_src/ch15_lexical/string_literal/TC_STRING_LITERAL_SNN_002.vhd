-- =============================================================
-- Case ID: TC_STRING_LITERAL_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.7
-- Production: string_literal ::= " { graphic_character } "
-- Case Type: Negative
-- Test Focus: string_literal: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity string_literal_e2 is end entity;
architecture bh of string_literal_e2 is
  -- ERROR: invalid syntax in string_literal
  signal s : bit;
begin
  s <= '1'
end architecture bh;