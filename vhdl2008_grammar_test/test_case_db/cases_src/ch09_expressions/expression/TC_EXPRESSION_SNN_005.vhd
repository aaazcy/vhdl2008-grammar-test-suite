-- =============================================================
-- Case ID: TC_EXPRESSION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: expression ::= condition_operator primary | logical_expression
-- Case Type: Negative
-- Test Focus: SNN: ambiguous and/or mixing without parentheses: logical operators of the same precedence appear mixed without parenthesized grouping, violating the precedence rules
-- Expected Result: Triggers syntax error: ambiguous logical operator precedence
-- Dependencies: None
-- =============================================================
entity expr_snn5_ent is
  port(a, b, c : in boolean; y : out boolean);
end entity;
architecture err of expr_snn5_ent is
begin
  y <= a and b or c;
end architecture err;
