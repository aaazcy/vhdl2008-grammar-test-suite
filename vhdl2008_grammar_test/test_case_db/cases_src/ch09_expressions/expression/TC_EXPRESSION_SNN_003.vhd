-- =============================================================
-- Case ID: TC_EXPRESSION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: expression ::= condition_operator primary | logical_expression
-- Case Type: Negative
-- Test Focus: SNN: unclosed parenthesis: the closing right parenthesis is missing in the logical_expression, so the expression syntax is incomplete
-- Expected Result: Triggers syntax error: missing closing parenthesis
-- Dependencies: None
-- =============================================================
entity expr_snn3_ent is
  port(a, b, c : in boolean; y : out boolean);
end entity;
architecture err of expr_snn3_ent is
begin
  y <= (a and b or c;
end architecture err;
