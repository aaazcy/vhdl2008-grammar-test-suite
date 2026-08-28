-- =============================================================
-- Case ID: TC_CONDITION_OPERATOR_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_CONDITION_OPERATOR_BAD_TYPE
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: condition_operator ::= ??
-- Case Type: Negative
-- Rule Description: The condition operator ?? is predefined only for types BIT and STD_ULOGIC (and one-dimensional arrays thereof). It cannot be applied to INTEGER, REAL, or other non-logical types.
-- Error Category: Type mismatch
-- Test Focus: SMN: ?? applied to the real type — attempting to apply ?? to a real floating-point number, verifying that the implicit conversion of condition_operator is predefined only for BIT and STD_ULOGIC and their one-dimensional arrays, so the real type cannot be an operand of ??
-- Expected Result: Triggers semantic error: ?? condition_operator not defined for real type
-- Dependencies: None
-- =============================================================
entity ent_smn_co_real is
  port (
    val_i : in  real;
    y_o   : out integer
  );
end entity ent_smn_co_real;

architecture rtl of ent_smn_co_real is
begin
  -- ERROR: ?? condition_operator requires bit/std_ulogic type, not real
  y_o <= 1 when ?? val_i else 0;
end architecture rtl;
