-- =============================================================
-- Case ID: TC_SHIFT_EXPRESSION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_expression ::= simple_expression [ shift_operator simple_expression ]
-- Case Type: Negative
-- Test Focus: SNN — shift applied to a non-vector type: sll shift used on integer, sll requires bit_vector/signed/unsigned
-- Expected Result: Triggers semantic error: shift operator requires one-dimensional array type
-- Dependencies: None
-- =============================================================
entity shf_snn2_ent is
  port(x : in integer; y : out integer);
end entity;
architecture err of shf_snn2_ent is
begin
  y <= x sll 2;
end architecture err;
