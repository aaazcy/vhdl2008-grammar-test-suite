-- =============================================================
-- Case ID: TC_SHIFT_EXPRESSION_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_SHIFT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_expression ::= simple_expression [ shift_operator simple_expression ]
-- Case Type: Negative
-- Rule Description: The right operand (shift amount) of the shift operator must be integer type
-- Error Category: type_mismatch
-- Test Focus: SMN: sll shift amount type error — in a sll 1.5 the right operand is real literal 1.5, the shift amount must be integer type, there is no bit_vector sll real overload
-- Expected Result: Triggers analysis error: no function declarations for operator "sll"
-- Dependencies: None
-- =============================================================
entity shf_bad_amount_type is
  port(a : in bit_vector(7 downto 0); y : out bit_vector(7 downto 0));
end entity;
architecture vhdl2008 of shf_bad_amount_type is
begin
  y <= a sll 1.5;
end architecture vhdl2008;
