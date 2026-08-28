-- =============================================================
-- Case ID: TC_LOGICAL_OPERATOR_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_operator ::= and | or | nand | nor | xor | xnor
-- Case Type: Negative
-- Test Focus: SNN: missing operand between two consecutive logical_operators — and and or appear consecutively in "a_i and or b_i", verifying that BNF requires a relation on both sides of logical_operator, two adjacent operators with no intervening operand violate the syntax
-- Expected Result: Triggers syntax error: consecutive logical_operators without relation between them
-- Dependencies: None
-- =============================================================
entity ent_consecutive_ops is
  port (
    a_i : in  bit;
    b_i : in  bit;
    y_o : out bit
  );
end entity ent_consecutive_ops;

architecture rtl of ent_consecutive_ops is
begin
  -- ERROR: two consecutive logical_operators with no relation between them
  y_o <= a_i and or b_i;
end architecture rtl;
