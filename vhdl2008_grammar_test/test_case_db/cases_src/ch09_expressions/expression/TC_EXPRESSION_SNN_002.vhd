-- =============================================================
-- Case ID: TC_EXPRESSION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: expression ::= condition_operator primary | logical_expression
-- Case Type: Negative
-- Test Focus: SNN: incomplete logical_expression: a leftover and operator at the end of the relation chain is missing its right-side relation, making the expression incomplete
-- Expected Result: Triggers syntax error: missing relation after 'and' operator
-- Dependencies: None
-- =============================================================
entity expr_snn2_ent is
  port(a, b : in integer; y : out boolean);
end entity;
architecture err of expr_snn2_ent is
begin
  y <= a < b and;
end architecture err;
