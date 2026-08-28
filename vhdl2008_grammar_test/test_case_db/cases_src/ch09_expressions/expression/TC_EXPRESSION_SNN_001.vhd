-- =============================================================
-- Case ID: TC_EXPRESSION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: expression ::= condition_operator primary | logical_expression
-- Case Type: Negative
-- Test Focus: SNN: incomplete condition_operator: no primary after ??, followed directly by a semicolon; the BNF requires condition_operator to be followed by a primary
-- Expected Result: Triggers syntax error: missing primary after condition_operator ??
-- Dependencies: None
-- =============================================================
entity expr_snn1_ent is
  port(flag : in bit; y : out boolean);
end entity;
architecture err of expr_snn1_ent is
begin
  y <= ?? ;
end architecture err;
