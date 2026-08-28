-- =============================================================
-- Case ID: TC_SIMPLE_EXPRESSION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: simple_expression ::= [ sign ] term { adding_operator term }
-- Case Type: Positive
-- Test Focus: Positive sign prefix: [ sign ] takes the positive sign, the term is signal a, the expression is +a
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sexpr_pos_sign_ent is
  port(a : in integer; y : out integer);
end entity;
architecture rtl of sexpr_pos_sign_ent is
begin
  y <= +a;
end architecture rtl;
