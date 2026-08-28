-- =============================================================
-- Case ID: TC_SHIFT_OPERATOR_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_operator ::= sll | srl | sla | sra | rol | ror
-- Case Type: Negative
-- Test Focus: SNN: missing operand between two consecutive shift_operators — in "din sll srl 2" there is no operand between sll and srl, verifying that a shift_expression can have only one optional [ shift_operator simple_expression ] segment, shift_operators cannot be chained
-- Expected Result: Triggers syntax error: unexpected shift_operator after shift_expression
-- Dependencies: None
-- =============================================================
entity ent_snn_double_shift is
  port (
    din  : in  bit_vector(7 downto 0);
    dout : out bit_vector(7 downto 0)
  );
end entity ent_snn_double_shift;

architecture rtl of ent_snn_double_shift is
begin
  -- ERROR: two consecutive shift_operators, no intermediate operand
  dout <= din sll srl 2;
end architecture rtl;
