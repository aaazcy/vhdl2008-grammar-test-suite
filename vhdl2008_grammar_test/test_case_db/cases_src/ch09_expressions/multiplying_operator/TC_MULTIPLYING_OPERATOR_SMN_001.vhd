-- =============================================================
-- Case ID: TC_MULTIPLYING_OPERATOR_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_MULTIPLYING_OPERATOR_MOD_REAL
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: multiplying_operator ::= * | / | mod | rem
-- Case Type: Negative
-- Rule Description: The operators mod and rem are predefined for any integer type only. They cannot be applied to floating-point types.
-- Error Category: Type mismatch
-- Test Focus: SMN: rem operator used on real type — attempting a rem operation on two real floating-point operands, verifying that the VHDL standard specifies mod and rem apply only to integer types, floating-point types have no integer division/remainder semantics
-- Expected Result: Triggers semantic error: rem operator requires integer types, cannot be used with real
-- Dependencies: None
-- =============================================================
entity ent_smn_rem_real is
  port (
    a_i : in  real;
    b_i : in  real;
    y_o : out real
  );
end entity ent_smn_rem_real;

architecture rtl of ent_smn_rem_real is
begin
  -- ERROR: rem operator is predefined for integer types only, not real
  y_o <= a_i rem b_i;
end architecture rtl;
