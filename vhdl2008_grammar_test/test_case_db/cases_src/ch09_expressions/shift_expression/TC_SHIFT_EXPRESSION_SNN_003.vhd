-- =============================================================
-- Case ID: TC_SHIFT_EXPRESSION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_expression ::= simple_expression [ shift_operator simple_expression ]
-- Case Type: Negative
-- Test Focus: SNN: simple_expression missing after shift_operator — in expression a sll ; there is no operand on the right side of sll, the right simple_expression of shift_expression is missing
-- Expected Result: Triggers syntax error: primary expression expected
-- Dependencies: None
-- =============================================================
entity shf_missing_right is
  port(a : in bit_vector(7 downto 0); y : out bit_vector(7 downto 0));
end entity;
architecture vhdl2008 of shf_missing_right is
begin
  y <= a sll ;
end architecture vhdl2008;
