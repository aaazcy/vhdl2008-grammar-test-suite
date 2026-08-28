-- =============================================================
-- Case ID: TC_EXPRESSION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: expression ::= condition_operator primary | logical_expression
-- Case Type: Negative
-- Test Focus: SNN: illegal token replacing condition_operator: a single ? is used instead of ??; the condition_operator required by the BNF is the double question mark
-- Expected Result: Triggers syntax error: invalid condition operator token
-- Dependencies: None
-- =============================================================
entity expr_snn4_ent is
  port(flag : in bit; y : out boolean);
end entity;
architecture err of expr_snn4_ent is
begin
  y <= ? flag;
end architecture err;
