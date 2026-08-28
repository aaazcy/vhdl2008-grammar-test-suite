-- =============================================================
-- Case ID: TC_SIGN_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_SIGN_NON_NUMERIC
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: sign ::= + | -
-- Case Type: Negative
-- Rule Description: The sign operators + and - are predefined only for numeric types. They cannot be applied to enumeration, array, or record types.
-- Error Category: Type mismatch
-- Test Focus: SMN: sign used on an enumeration type — attempt to apply the unary + to a value of a user-defined enumeration type, verifying that sign is predefined only for numeric types, an enumeration type is not numeric and cannot take a unary sign
-- Expected Result: Triggers semantic error: sign operator not defined for enumeration type
-- Dependencies: None
-- =============================================================
entity ent_smn_sign_enum is
  type t_color is (RED, GREEN, BLUE);
  port (
    a_i : in  t_color;
    y_o : out t_color
  );
end entity ent_smn_sign_enum;

architecture rtl of ent_smn_sign_enum is
begin
  -- ERROR: sign operator not defined for enumeration type
  y_o <= +a_i;
end architecture rtl;
