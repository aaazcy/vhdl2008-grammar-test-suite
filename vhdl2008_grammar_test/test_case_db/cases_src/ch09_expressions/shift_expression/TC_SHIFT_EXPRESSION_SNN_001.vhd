-- =============================================================
-- Case ID: TC_SHIFT_EXPRESSION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_expression ::= simple_expression [ shift_operator simple_expression ]
-- Case Type: Negative
-- Test Focus: SNN — simple_expression missing after sll: the sll operator requires a right operand
-- Expected Result: Triggers syntax error: missing right operand after shift operator
-- Dependencies: None
-- =============================================================
entity shf_snn1_ent is
  port(a : in bit_vector(7 downto 0); y : out bit_vector(7 downto 0));
end entity;
architecture err of shf_snn1_ent is
begin
  y <= a sll ;
end architecture err;
