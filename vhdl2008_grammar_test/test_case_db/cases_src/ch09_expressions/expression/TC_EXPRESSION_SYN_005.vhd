-- =============================================================
-- Case ID: TC_EXPRESSION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: expression ::= condition_operator primary | logical_expression
-- Case Type: Positive
-- Test Focus: expression in a conditional signal assignment: a logical_expression as the when condition (a > b), and another logical expression as the assignment source (a + b > threshold)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity expr_cond_assign_ent is
  port(a, b, threshold : in integer; result : out boolean);
end entity;
architecture rtl of expr_cond_assign_ent is
begin
  result <= true when (a > b) and (a + b > threshold) else false;
end architecture rtl;
