-- =============================================================
-- Case ID: TC_SIMPLE_EXPRESSION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: simple_expression ::= [ sign ] term { adding_operator term }
-- Case Type: Positive
-- Test Focus: Negative sign prefix: [ sign ] takes the negative sign, the term is signal b, the expression is -b, meaning negation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sexpr_neg_sign_ent is
  port(b : in integer; y : out integer);
end entity;
architecture rtl of sexpr_neg_sign_ent is
begin
  y <= -b;
end architecture rtl;
