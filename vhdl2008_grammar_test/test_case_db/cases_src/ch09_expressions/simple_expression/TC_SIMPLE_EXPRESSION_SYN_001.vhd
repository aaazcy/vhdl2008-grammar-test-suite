-- =============================================================
-- Case ID: TC_SIMPLE_EXPRESSION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: simple_expression ::= [ sign ] term { adding_operator term }
-- Case Type: Positive
-- Test Focus: Minimal form: a single term (constant value 1), no sign, no adding_operator, the minimal simple_expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sexpr_min_ent is
  port(y : out integer);
end entity;
architecture rtl of sexpr_min_ent is
begin
  y <= 5;
end architecture rtl;
