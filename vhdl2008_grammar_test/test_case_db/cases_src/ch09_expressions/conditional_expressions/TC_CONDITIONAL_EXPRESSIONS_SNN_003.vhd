-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Negative
-- Test Focus: SNN: missing else expression — in y <= a when cond else the alternative expression is missing after else
-- Expected Result: Triggers syntax error: missing expression after 'else' in conditional expression
-- Dependencies: None
-- =============================================================

entity ent_ce_snn_003 is
  port (a, b : in integer; cond : in boolean);
end entity ent_ce_snn_003;

architecture miss_else_expr of ent_ce_snn_003 is
  signal y : integer;
begin
  -- ERROR: Missing expression after 'else' keyword
  y <= a when cond else ;
end architecture miss_else_expr;
