-- =============================================================
-- Case ID: TC_FACTOR_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_FACTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: factor ::= primary [ ** primary ] | abs primary | not primary | logical_operator primary
-- Case Type: Positive
-- Rule Description: exponentiation ** requires the left operand to be integer or floating type, right operand integer type
-- Test Focus: ** operand type rules: exponentiation of integer ** integer, with the right operand of integer type, conforming to the semantic rules
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fac_sem1_ent is
  port(base : in integer; exp : in integer; pow : out integer);
end entity;
architecture rtl of fac_sem1_ent is
begin
  pow <= base ** exp;
end architecture rtl;
