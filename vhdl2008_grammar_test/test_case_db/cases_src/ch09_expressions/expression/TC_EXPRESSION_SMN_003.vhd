-- =============================================================
-- Case ID: TC_EXPRESSION_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: expression ::= condition_operator primary | logical_expression
-- Case Type: Negative
-- Rule Description: The ?? condition operator must convert to a boolean context; applying ?? where a logical expression is expected breaks type rules
-- Error Category: type_mismatch
-- Test Focus: failed implicit conversion of a ?? expression: mixing the result of ?? with a non-boolean type inside an inner logical_expression violates the type propagation rules
-- Expected Result: Triggers semantic error: condition_operator ?? requires boolean context
-- Dependencies: None
-- =============================================================
entity expr_smn3_ent is
  port(a, b : in bit; y : out integer);
end entity;
architecture err of expr_smn3_ent is
begin
  y <= 1 + (?? a);
end architecture err;
