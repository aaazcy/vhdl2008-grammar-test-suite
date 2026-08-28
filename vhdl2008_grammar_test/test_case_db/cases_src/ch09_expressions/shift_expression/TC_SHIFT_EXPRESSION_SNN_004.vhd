-- =============================================================
-- Case ID: TC_SHIFT_EXPRESSION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_expression ::= simple_expression [ shift_operator simple_expression ]
-- Case Type: Negative
-- Test Focus: SNN — wrong shift operator name: shift_left used as the operator, the correct one is sll
-- Expected Result: Triggers syntax error: invalid shift operator
-- Dependencies: None
-- =============================================================
entity shf_snn4_ent is
  port(a : in bit_vector(7 downto 0); y : out bit_vector(7 downto 0));
end entity;
architecture err of shf_snn4_ent is
begin
  y <= a shift_left 1;
end architecture err;
