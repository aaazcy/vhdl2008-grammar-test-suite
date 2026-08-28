-- =============================================================
-- Case ID: TC_EXPRESSION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: expression ::= condition_operator primary | logical_expression
-- Case Type: Negative
-- Rule Description: Logical expression operands must be of the same logical type
-- Error Category: type_mismatch
-- Test Focus: SMN: logical operation type mismatch — in a_bit and b_bool the left side of and is of type bit and the right side is of type boolean; a logical operation requires the operand types on both sides to be consistent
-- Expected Result: Triggers analysis error: no function declarations for operator "and"
-- Dependencies: None
-- =============================================================
entity expr_bit_and_bool is
  port(a_bit : in bit; b_bool : in boolean; y : out boolean);
end entity;
architecture vhdl2008 of expr_bit_and_bool is
begin
  y <= a_bit and b_bool;
end architecture vhdl2008;
