-- =============================================================
-- Case ID: TC_SIMPLE_EXPRESSION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: simple_expression ::= [ sign ] term { adding_operator term }
-- Case Type: Negative
-- Test Focus: SNN — missing intermediate term: two consecutive adding_operators with no term in between
-- Expected Result: Triggers syntax error: missing term between adding operators
-- Dependencies: None
-- =============================================================
entity sexpr_snn5_ent is
  port(a, b : in integer; y : out integer);
end entity;
architecture err of sexpr_snn5_ent is
begin
  y <= a + - b;
end architecture err;
