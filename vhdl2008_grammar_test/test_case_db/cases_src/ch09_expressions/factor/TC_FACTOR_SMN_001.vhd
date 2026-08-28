-- =============================================================
-- Case ID: TC_FACTOR_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_FACTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: factor ::= primary [ ** primary ] | abs primary | not primary | logical_operator primary
-- Case Type: Negative
-- Rule Description: exponent ** right operand must be integer type
-- Error Category: type_mismatch
-- Test Focus: ** right operand type error: the right operand uses type real instead of integer; ** requires the exponent to be of integer type
-- Expected Result: Triggers semantic error: exponentiation right operand must be integer type
-- Dependencies: None
-- =============================================================
entity fac_smn1_ent is
  port(base : in integer; exp : in real; y : out integer);
end entity;
architecture err of fac_smn1_ent is
begin
  y <= base ** exp;
end architecture err;
