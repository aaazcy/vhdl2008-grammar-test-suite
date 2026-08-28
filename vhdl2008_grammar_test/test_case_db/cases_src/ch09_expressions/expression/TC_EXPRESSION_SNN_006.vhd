-- =============================================================
-- Case ID: TC_EXPRESSION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: expression ::= condition_operator primary | logical_expression
-- Case Type: Negative
-- Test Focus: SNN: consecutive binary operators: two and operators appear consecutively in the logical_expression with the relation between them missing
-- Expected Result: Triggers syntax error: consecutive binary operators without operand
-- Dependencies: None
-- =============================================================
entity expr_snn6_ent is
  port(a, b : in integer; y : out boolean);
end entity;
architecture err of expr_snn6_ent is
begin
  y <= a < b and or b > 0;
end architecture err;
