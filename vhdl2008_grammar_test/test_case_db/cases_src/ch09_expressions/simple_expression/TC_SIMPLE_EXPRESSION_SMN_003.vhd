-- =============================================================
-- Case ID: TC_SIMPLE_EXPRESSION_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_SIMPLE_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: simple_expression ::= [ sign ] term { adding_operator term }
-- Case Type: Negative
-- Rule Description: Adding operators + and - require numeric operands; & requires array operands
-- Error Category: type_mismatch
-- Test Focus: mixed operand types for +: integer and bit joined with +, bit cannot be used in arithmetic addition
-- Expected Result: Triggers semantic error: adding operator requires numeric operands
-- Dependencies: None
-- =============================================================
entity sexpr_smn3_ent is
  port(a : in integer; b : in bit; y : out integer);
end entity;
architecture err of sexpr_smn3_ent is
begin
  y <= a + b;
end architecture err;
