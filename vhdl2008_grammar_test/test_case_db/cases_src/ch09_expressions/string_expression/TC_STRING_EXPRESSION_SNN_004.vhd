-- =============================================================
-- Case ID: TC_STRING_EXPRESSION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: string_expression ::= expression
-- Case Type: Negative
-- Test Focus: SNN: a single character is not a string — 'a' is a character literal, not a string, and cannot be assigned to the string type
-- Expected Result: Triggers type error: character literal cannot be assigned to string type
-- Dependencies: None
-- =============================================================

entity ent_str_snn_004 is
  port (y : out string(1 to 1));
end entity ent_str_snn_004;

architecture char_not_str of ent_str_snn_004 is
begin
  -- ERROR: Character literal 'a' is not string — use "a" instead
  y <= 'a';
end architecture char_not_str;
