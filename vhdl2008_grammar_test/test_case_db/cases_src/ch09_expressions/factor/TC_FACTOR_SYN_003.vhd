-- =============================================================
-- Case ID: TC_FACTOR_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FACTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: factor ::= primary [ ** primary ] | abs primary | not primary | logical_operator primary
-- Case Type: Positive
-- Test Focus: abs prefix form: the factor is abs primary, taking the absolute value of the signed input before assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fac_abs_ent is
  port(sample_in : in integer; mag_out : out integer);
end entity;
architecture rtl of fac_abs_ent is
begin
  mag_out <= abs sample_in;
end architecture rtl;
