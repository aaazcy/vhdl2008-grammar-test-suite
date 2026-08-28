-- =============================================================
-- Case ID: TC_SIMPLE_EXPRESSION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: simple_expression ::= [ sign ] term { adding_operator term }
-- Case Type: Positive
-- Test Focus: term - term: two terms joined by adding_operator -, basic subtraction
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sexpr_sub_ent is
  port(a, b : in integer; diff : out integer);
end entity;
architecture rtl of sexpr_sub_ent is
begin
  diff <= a - b;
end architecture rtl;
