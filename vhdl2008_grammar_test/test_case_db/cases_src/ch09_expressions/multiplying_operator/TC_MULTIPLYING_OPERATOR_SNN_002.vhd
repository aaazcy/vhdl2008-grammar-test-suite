-- =============================================================
-- Case ID: TC_MULTIPLYING_OPERATOR_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_MULTIPLYING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: multiplying_operator ::= * | / | mod | rem
-- Case Type: Negative
-- Test Focus: SNN: mod operator used on non-integer type real — attempting a mod operation on two real type operands, verifying that mod/rem of multiplying_operator can only be used on integer types, real type has no division and modulo definitions
-- Expected Result: Triggers semantic error: mod operator requires integer operands, not real
-- Dependencies: None
-- =============================================================
entity ent_mod_bad_type is
  port (
    a_i : in  real;
    b_i : in  real;
    y_o : out real
  );
end entity ent_mod_bad_type;

architecture rtl of ent_mod_bad_type is
begin
  -- ERROR: mod operator requires integer operands, not real
  y_o <= a_i mod b_i;
end architecture rtl;
