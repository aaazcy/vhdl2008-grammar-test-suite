-- =============================================================
-- Case ID: TC_LOGICAL_OPERATOR_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_operator ::= and | or | nand | nor | xor | xnor
-- Case Type: Negative
-- Test Focus: SNN: missing operand on the right side of the and operator — "a_i and" is followed directly by a semicolon with no second operand, verifying that logical_operator as a binary operator requires operands on both sides, the right operand cannot be omitted
-- Expected Result: Triggers syntax error: missing right operand after logical_operator "and"
-- Dependencies: None
-- =============================================================
entity ent_missing_rhs_and is
  port (
    a_i : in  bit;
    y_o : out bit
  );
end entity ent_missing_rhs_and;

architecture rtl of ent_missing_rhs_and is
begin
  -- ERROR: missing right operand after logical_operator "and"
  y_o <= a_i and;
end architecture rtl;
