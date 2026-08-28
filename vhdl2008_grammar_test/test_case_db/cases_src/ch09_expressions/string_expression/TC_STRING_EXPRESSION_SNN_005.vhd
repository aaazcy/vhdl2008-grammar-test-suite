-- =============================================================
-- Case ID: TC_STRING_EXPRESSION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_STRING_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: string_expression ::= expression
-- Case Type: Negative
-- Test Focus: SNN: string concatenation type error — "abc" & 123 concatenates a string with an integer, and the & operand types are incompatible
-- Expected Result: Triggers type error: cannot concatenate string with integer — type mismatch
-- Dependencies: None
-- =============================================================

entity ent_str_snn_005 is
  port (y : out string(1 to 6));
end entity ent_str_snn_005;

architecture bad_cat of ent_str_snn_005 is
begin
  -- ERROR: Cannot concatenate string with integer
  y <= "abc" & 123;
end architecture bad_cat;
