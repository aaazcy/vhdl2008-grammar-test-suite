-- =============================================================
-- Case ID: TC_SIMPLE_EXPRESSION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: simple_expression ::= [ sign ] term { adding_operator term }
-- Case Type: Negative
-- Test Focus: SNN — term missing after adding_operator: no term follows the + operator, the chain is incomplete
-- Expected Result: Triggers syntax error: missing term after adding operator
-- Dependencies: None
-- =============================================================
entity sexpr_snn1_ent is
  port(a : in integer; y : out integer);
end entity;
architecture err of sexpr_snn1_ent is
begin
  y <= a + ;
end architecture err;
