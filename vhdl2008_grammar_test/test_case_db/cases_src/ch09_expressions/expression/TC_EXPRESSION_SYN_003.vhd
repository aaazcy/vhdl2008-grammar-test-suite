-- =============================================================
-- Case ID: TC_EXPRESSION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: expression ::= condition_operator primary | logical_expression
-- Case Type: Positive
-- Test Focus: logical_expression with an and chain: three relations chained with and, verifying consecutive and operations on multiple operands
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity expr_and_chain_ent is
  port(a, b, c, d : in integer; y : out boolean);
end entity;
architecture rtl of expr_and_chain_ent is
begin
  y <= (a < b) and (b < c) and (c < d);
end architecture rtl;
