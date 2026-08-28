-- =============================================================
-- Case ID: TC_MISCELLANEOUS_OPERATOR_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_MISCELLANEOUS_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: miscellaneous_operator ::= ** | abs | not
-- Case Type: Negative
-- Test Focus: SNN: exponent of the ** operator is non-integer real — attempting exponentiation using real as the exponent, verifying that the right-side exponent of the ** operator must be integer type, a real type exponent is not allowed
-- Expected Result: Triggers semantic error: exponent of ** must be integer type
-- Dependencies: None
-- =============================================================
entity ent_power_bad_exp is
  port (
    base_i : in  integer;
    exp_i  : in  real;
    y_o    : out real
  );
end entity ent_power_bad_exp;

architecture rtl of ent_power_bad_exp is
begin
  -- ERROR: exponent of ** must be integer type, not real
  y_o <= real(base_i) ** exp_i;
end architecture rtl;
