-- =============================================================
-- Case ID: TC_SIMPLE_EXPRESSION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_SIMPLE_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: simple_expression ::= [ sign ] term { adding_operator term }
-- Case Type: Negative
-- Rule Description: The concatenation operator & requires array type operands
-- Error Category: type_mismatch
-- Test Focus: wrong & operand types: integer and integer joined with &, & requires array type operands
-- Expected Result: Triggers semantic error: concatenation requires one-dimensional array operands
-- Dependencies: None
-- =============================================================
entity sexpr_smn2_ent is
  port(a, b : in integer; y : out integer);
end entity;
architecture err of sexpr_smn2_ent is
begin
  y <= a & b;
end architecture err;
