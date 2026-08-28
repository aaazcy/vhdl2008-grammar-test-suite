-- =============================================================
-- Case ID: TC_EXPRESSION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: expression ::= condition_operator primary | logical_expression
-- Case Type: Positive
-- Rule Description: Expression type must be compatible with the assignment target type
-- Test Focus: Type compatibility: the result of an integer expression is assigned to a boolean target, verifying that the semantic rules require the expression type to match the target type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity expr_sem1_ent is
  port(a, b : in integer; y : out boolean);
end entity;
architecture rtl of expr_sem1_ent is
begin
  y <= a < b;
end architecture rtl;
