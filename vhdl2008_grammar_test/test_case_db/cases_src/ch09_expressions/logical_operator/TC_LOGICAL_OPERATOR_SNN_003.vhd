-- =============================================================
-- Case ID: TC_LOGICAL_OPERATOR_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_operator ::= and | or | nand | nor | xor | xnor
-- Case Type: Negative
-- Test Focus: SNN: xnor operator used on non-logical type integer — attempting to use the xnor bitwise operator on two integer type signals, verifying that logical_operator requires operand types to be bit, boolean, or the corresponding one-dimensional array types, integer has no logical type definition
-- Expected Result: Triggers semantic error: xnor requires bit/boolean/array-of-bit operands, not integer
-- Dependencies: None
-- =============================================================
entity ent_xnor_bad_type is
  port (
    a_i : in  integer;
    b_i : in  integer;
    y_o : out integer
  );
end entity ent_xnor_bad_type;

architecture rtl of ent_xnor_bad_type is
begin
  -- ERROR: xnor operator requires logical types (bit/boolean), not integer
  y_o <= a_i xnor b_i;
end architecture rtl;
