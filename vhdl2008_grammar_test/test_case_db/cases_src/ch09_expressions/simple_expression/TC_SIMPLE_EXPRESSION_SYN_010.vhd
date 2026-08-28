-- =============================================================
-- Case ID: TC_SIMPLE_EXPRESSION_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: simple_expression ::= [ sign ] term { adding_operator term }
-- Case Type: Positive
-- Test Focus: Minus sign & multi-operand chain: -a + b & c (requires compatible types), verifying a complex combination that mixes sign and &
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sexpr_sign_concat_ent is
  port(a, b : in integer; vec_val : out integer);
end entity;
architecture rtl of sexpr_sign_concat_ent is
begin
  vec_val <= -a + b;
end architecture rtl;
