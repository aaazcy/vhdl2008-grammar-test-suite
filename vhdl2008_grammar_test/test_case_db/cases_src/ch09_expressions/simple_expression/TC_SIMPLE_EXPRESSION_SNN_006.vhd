-- =============================================================
-- Case ID: TC_SIMPLE_EXPRESSION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: simple_expression ::= [ sign ] term { adding_operator term }
-- Case Type: Negative
-- Test Focus: SNN — operator precedence error: & joins an integer expression result with bit_vector, & requires compatible array types
-- Expected Result: Triggers semantic error: concatenation operand type mismatch
-- Dependencies: None
-- =============================================================
entity sexpr_snn6_ent is
  port(a, b : in integer; y : out bit_vector(7 downto 0));
end entity;
architecture err of sexpr_snn6_ent is
begin
  y <= a + b;
end architecture err;
