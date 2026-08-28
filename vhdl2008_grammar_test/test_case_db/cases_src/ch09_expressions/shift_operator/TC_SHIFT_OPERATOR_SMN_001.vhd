-- =============================================================
-- Case ID: TC_SHIFT_OPERATOR_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_SHIFT_OPERATOR_NON_VECTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_operator ::= sll | srl | sla | sra | rol | ror
-- Case Type: Negative
-- Rule Description: Shift operators require the left operand to be a one-dimensional array of BIT or BOOLEAN type. Integer and other scalar types cannot be shifted.
-- Error Category: Type mismatch
-- Test Focus: SMN: sla arithmetic left shift applied to a non-vector scalar type — attempt to use sla on natural, verifying that the left operand of shift_operator must be a one-dimensional array, natural is a scalar type and cannot be a shift target
-- Expected Result: Triggers semantic error: shift_operator requires array type (bit_vector etc.), natural is a scalar
-- Dependencies: None
-- =============================================================
entity ent_smn_scalar_shift is
  port (
    din  : in  natural range 0 to 255;
    dout : out natural range 0 to 255
  );
end entity ent_smn_scalar_shift;

architecture rtl of ent_smn_scalar_shift is
begin
  -- ERROR: shift_operator requires array type, natural is scalar
  dout <= din sla 2;
end architecture rtl;
