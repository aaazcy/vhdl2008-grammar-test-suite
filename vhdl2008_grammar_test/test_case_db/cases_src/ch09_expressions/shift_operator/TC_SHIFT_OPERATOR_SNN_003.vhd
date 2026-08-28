-- =============================================================
-- Case ID: TC_SHIFT_OPERATOR_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_operator ::= sll | srl | sla | sra | rol | ror
-- Case Type: Negative
-- Test Focus: SNN: sll shift operator applied to non-vector type integer — attempt to logically shift left an integer, verifying that shift_operator can only be used on one-dimensional array types (bit_vector/signed/unsigned/std_logic_vector etc.), integer is a scalar and cannot be shifted
-- Expected Result: Triggers semantic error: shift_operator requires array type operand, not integer
-- Dependencies: None
-- =============================================================
entity ent_snn_bad_type is
  port (
    din  : in  integer;
    dout : out integer
  );
end entity ent_snn_bad_type;

architecture rtl of ent_snn_bad_type is
begin
  -- ERROR: sll requires an array type operand, integer is a scalar type
  dout <= din sll 2;
end architecture rtl;
