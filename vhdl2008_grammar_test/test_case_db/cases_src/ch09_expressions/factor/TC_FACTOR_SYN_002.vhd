-- =============================================================
-- Case ID: TC_FACTOR_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_FACTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: factor ::= primary [ ** primary ] | abs primary | not primary | logical_operator primary
-- Case Type: Positive
-- Test Focus: power form: primary ** primary — computing the base exponent_base raised to the exponent power, used for arithmetic operations
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fac_pow_ent is
  port(base_val : in integer; exp_val : in integer; result : out integer);
end entity;
architecture rtl of fac_pow_ent is
begin
  result <= base_val ** exp_val;
end architecture rtl;
