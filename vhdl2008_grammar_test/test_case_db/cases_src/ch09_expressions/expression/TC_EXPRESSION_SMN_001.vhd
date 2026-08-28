-- =============================================================
-- Case ID: TC_EXPRESSION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: expression ::= condition_operator primary | logical_expression
-- Case Type: Negative
-- Rule Description: The ?? condition operator requires the operand to be implicitly convertible to boolean
-- Error Category: type_mismatch
-- Test Focus: ?? applied to a type with no implicit boolean conversion: the ?? operator applied to the integer type; integer has no implicit conversion to boolean
-- Expected Result: Triggers semantic error: ?? operator operand must be implicitly convertible to boolean
-- Dependencies: None
-- =============================================================
entity expr_smn1_ent is
  port(data : in integer; y : out boolean);
end entity;
architecture err of expr_smn1_ent is
begin
  y <= ?? data;
end architecture err;
