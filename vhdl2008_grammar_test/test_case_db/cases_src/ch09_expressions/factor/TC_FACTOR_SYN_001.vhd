-- =============================================================
-- Case ID: TC_FACTOR_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_FACTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: factor ::= primary [ ** primary ] | abs primary | not primary | logical_operator primary
-- Case Type: Positive
-- Test Focus: Minimal form: the factor is only a single primary (signal name a), with no operator prefix, used directly in a signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fac_min_ent is
  port(a : in integer; y : out integer);
end entity;
architecture rtl of fac_min_ent is
begin
  y <= a;
end architecture rtl;
