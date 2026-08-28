-- =============================================================
-- Case ID: TC_EXPRESSION_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: expression ::= condition_operator primary | logical_expression
-- Case Type: Positive
-- Test Focus: nested parentheses: mixed and/or grouped with parentheses in a logical_expression, verifying the precedence of complex nested expressions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity expr_paren_ent is
  port(a, b, c, d : in boolean; y : out boolean);
end entity;
architecture rtl of expr_paren_ent is
begin
  y <= (a and b) or (c and (d or a)) or (not b and c);
end architecture rtl;
