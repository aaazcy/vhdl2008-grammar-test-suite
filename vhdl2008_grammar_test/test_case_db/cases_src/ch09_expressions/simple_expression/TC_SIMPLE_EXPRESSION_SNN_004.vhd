-- =============================================================
-- Case ID: TC_SIMPLE_EXPRESSION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: simple_expression ::= [ sign ] term { adding_operator term }
-- Case Type: Negative
-- Test Focus: SNN — dangling operator: a trailing + is left with no term, the simple_expression is not closed
-- Expected Result: Triggers syntax error: dangling adding operator at end of expression
-- Dependencies: None
-- =============================================================
entity sexpr_snn4_ent is
  port(a, b, c : in integer; y : out integer);
end entity;
architecture err of sexpr_snn4_ent is
begin
  y <= a + b + ;
end architecture err;
