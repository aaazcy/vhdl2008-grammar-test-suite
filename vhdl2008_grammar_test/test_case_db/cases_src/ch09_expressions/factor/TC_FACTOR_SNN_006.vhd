-- =============================================================
-- Case ID: TC_FACTOR_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_FACTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: factor ::= primary [ ** primary ] | abs primary | not primary | logical_operator primary
-- Case Type: Negative
-- Test Focus: SNN: missing operand: the single bare operator abs has no primary after it, so the factor is incomplete
-- Expected Result: Triggers syntax error: missing primary after abs operator
-- Dependencies: None
-- =============================================================
entity fac_snn6_ent is
  port(x : in integer; y : out integer);
end entity;
architecture err of fac_snn6_ent is
begin
  y <= abs;
end architecture err;
