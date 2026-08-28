-- =============================================================
-- Case ID: TC_FACTOR_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_FACTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: factor ::= primary [ ** primary ] | abs primary | not primary | logical_operator primary
-- Case Type: Negative
-- Rule Description: abs operator requires its operand to be a numeric type
-- Error Category: type_mismatch
-- Test Focus: abs operand type error: abs applied to the boolean type; boolean is not a numeric type
-- Expected Result: Triggers semantic error: abs requires numeric operand type
-- Dependencies: None
-- =============================================================
entity fac_smn2_ent is
  port(flag : in boolean; y : out boolean);
end entity;
architecture err of fac_smn2_ent is
begin
  y <= abs flag;
end architecture err;
