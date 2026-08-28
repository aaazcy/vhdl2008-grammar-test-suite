-- =============================================================
-- Case ID: TC_STRING_EXPRESSION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_STRING_EXPRESSION_LENGTH
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: string_expression ::= expression
-- Case Type: Negative
-- Rule Description: The type of the expression used in a string expression position must match the target string type
-- Error Category: Type mismatch with string target
-- Test Focus: SMN: a character literal appears in a string expression position——in y <= 'x', 'x' is a character type literal that does not match the target type string; a string_expression must produce a string type
-- Expected Result: Triggers analysis error: can't match character literal with array type "string"
-- Dependencies: None
-- =============================================================

entity str_expr_char_literal is
  port (y : out string(1 to 3));
end entity str_expr_char_literal;

architecture vhdl2008 of str_expr_char_literal is
begin
  y <= 'x';
end architecture vhdl2008;
