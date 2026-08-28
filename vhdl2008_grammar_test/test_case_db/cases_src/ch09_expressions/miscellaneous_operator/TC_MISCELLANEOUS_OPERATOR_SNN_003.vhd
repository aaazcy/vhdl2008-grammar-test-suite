-- =============================================================
-- Case ID: TC_MISCELLANEOUS_OPERATOR_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_MISCELLANEOUS_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: miscellaneous_operator ::= ** | abs | not
-- Case Type: Negative
-- Test Focus: SNN: abs operator used on non-numeric type bit — attempting an abs operation on a bit signal, verifying that abs as a miscellaneous_operator can only be used on numeric types (integer, real, physical), bit is not a numeric type
-- Expected Result: Triggers semantic error: abs requires numeric type, bit is not numeric
-- Dependencies: None
-- =============================================================
entity ent_abs_bad_type is
  port (
    a_i : in  bit;
    y_o : out bit
  );
end entity ent_abs_bad_type;

architecture rtl of ent_abs_bad_type is
begin
  -- ERROR: abs operator requires numeric operand, not bit
  y_o <= abs a_i;
end architecture rtl;
