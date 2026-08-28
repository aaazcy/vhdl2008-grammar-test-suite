-- =============================================================
-- Case ID: TC_SIMPLE_EXPRESSION_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: simple_expression ::= [ sign ] term { adding_operator term }
-- Case Type: Positive
-- Test Focus: Complex chain with nested parentheses: (a + b) - (c + d), parentheses affect term grouping, each parenthesized part contains its own adding_operator
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sexpr_paren_ent is
  port(a, b, c, d : in integer; y : out integer);
end entity;
architecture rtl of sexpr_paren_ent is
begin
  y <= (a + b) - (c + d);
end architecture rtl;
