-- =============================================================
-- Case ID: TC_SIMPLE_EXPRESSION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: simple_expression ::= [ sign ] term { adding_operator term }
-- Case Type: Negative
-- Test Focus: SNN — & concatenation conflict with differing types: bit and integer joined with &, & requires both sides to be array types
-- Expected Result: Triggers semantic error: concatenation requires array operands
-- Dependencies: None
-- =============================================================
entity sexpr_snn3_ent is
  port(a : in bit; b : in integer; y : out bit_vector(7 downto 0));
end entity;
architecture err of sexpr_snn3_ent is
begin
  y <= a & b;
end architecture err;
