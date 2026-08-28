-- =============================================================
-- Case ID: TC_SIMPLE_EXPRESSION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: simple_expression ::= [ sign ] term { adding_operator term }
-- Case Type: Positive
-- Test Focus: Three-term addition and subtraction: a three-link chain with sign, -a + b - c, verifying that a sign prefix coexists with an adding_operator chain
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sexpr_chain_ent is
  port(a, b, c : in integer; result : out integer);
end entity;
architecture rtl of sexpr_chain_ent is
begin
  result <= -a + b - c;
end architecture rtl;
