-- =============================================================
-- Case ID: TC_EXPRESSION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: expression ::= condition_operator primary | logical_expression
-- Case Type: Positive
-- Test Focus: Minimal form: expression as the minimal form of logical_expression — a single relation (a and b) in a signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity expr_min_ent is
  port(a, b : in bit; y : out bit);
end entity;
architecture rtl of expr_min_ent is
begin
  y <= a and b;
end architecture rtl;
