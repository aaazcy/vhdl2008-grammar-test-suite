-- =============================================================
-- Case ID: TC_ADDING_OPERATOR_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ADDING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: adding_operator ::= + | - | &
-- Case Type: Negative
-- Test Focus: SNN: missing term between two consecutive & operators - in the expression a_i & & b_i the position of the second & requires a term, an adding_operator cannot directly appear as the operand of another adding_operator
-- Expected Result: Triggers syntax error: unexpected token '&' in a primary
-- Dependencies: None
-- =============================================================
entity add_op_double_amp is
  port (
    a_i : in  bit;
    b_i : in  bit;
    y_o : out bit
  );
end entity add_op_double_amp;

architecture rtl of add_op_double_amp is
begin
  y_o <= a_i & & b_i;
end architecture rtl;
