-- =============================================================
-- Case ID: TC_SIGN_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGN
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: sign ::= + | -
-- Case Type: Negative
-- Test Focus: SNN: minus sign - used on non-numeric type boolean — attempt to negate a boolean signal with -, verifying that sign can only be used on numeric types (integer, real, physical, floating), boolean is not a numeric type
-- Expected Result: Triggers semantic error: sign requires numeric type, boolean is not numeric
-- Dependencies: None
-- =============================================================
entity ent_snn_sign_bool is
  port (
    a_i : in  boolean;
    y_o : out boolean
  );
end entity ent_snn_sign_bool;

architecture rtl of ent_snn_sign_bool is
begin
  -- ERROR: sign operator requires numeric operand, not boolean
  y_o <= -a_i;
end architecture rtl;
