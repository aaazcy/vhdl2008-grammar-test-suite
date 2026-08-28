-- =============================================================
-- Case ID: TC_SIMPLE_EXPRESSION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_SIMPLE_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: simple_expression ::= [ sign ] term { adding_operator term }
-- Case Type: Positive
-- Rule Description: The sign operator applies to numeric types; unary + and - require a numeric operand
-- Test Focus: sign applied to numeric types: the - prefix acts on an integer term, types are correct, compiles successfully
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sexpr_sem1_ent is
  port(val : in integer; negated : out integer);
end entity;
architecture rtl of sexpr_sem1_ent is
begin
  negated <= -val;
end architecture rtl;
