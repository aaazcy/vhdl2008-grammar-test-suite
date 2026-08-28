-- =============================================================
-- Case ID: TC_SIMPLE_EXPRESSION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: simple_expression ::= [ sign ] term { adding_operator term }
-- Case Type: Positive
-- Test Focus: term + term: two terms joined by adding_operator +, basic addition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sexpr_add_ent is
  port(x, y : in integer; sum : out integer);
end entity;
architecture rtl of sexpr_add_ent is
begin
  sum <= x + y;
end architecture rtl;
