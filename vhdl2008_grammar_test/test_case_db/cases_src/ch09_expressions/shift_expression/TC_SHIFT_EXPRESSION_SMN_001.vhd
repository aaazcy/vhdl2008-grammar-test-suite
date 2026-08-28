-- =============================================================
-- Case ID: TC_SHIFT_EXPRESSION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_SHIFT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_expression ::= simple_expression [ shift_operator simple_expression ]
-- Case Type: Negative
-- Rule Description: Shift operators require the left operand to be a one-dimensional array of bit or boolean elements
-- Error Category: type_mismatch
-- Test Focus: shift applied to a non-array type: integer followed by sll 2, the left side of sll must be a one-dimensional array type
-- Expected Result: Triggers semantic error: shift operator left operand must be one-dimensional array type
-- Dependencies: None
-- =============================================================
entity shf_smn1_ent is
  port(val : in integer; y : out integer);
end entity;
architecture err of shf_smn1_ent is
begin
  y <= val sll 2;
end architecture err;
