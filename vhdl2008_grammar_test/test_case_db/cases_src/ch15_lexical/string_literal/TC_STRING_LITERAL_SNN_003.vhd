-- =============================================================
-- Case ID: TC_STRING_LITERAL_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.7
-- Production: string_literal ::= " { graphic_character } "
-- Case Type: Negative
-- Test Focus: string_literal: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity string_literal_e3 is end entity;
architecture bh of string_literal_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;