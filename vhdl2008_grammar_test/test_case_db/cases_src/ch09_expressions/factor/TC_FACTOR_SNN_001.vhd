-- =============================================================
-- Case ID: TC_FACTOR_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_FACTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: factor ::= primary [ ** primary ] | abs primary | not primary | logical_operator primary
-- Case Type: Negative
-- Test Focus: SNN: missing primary on the right of **: only a ** is written with no following operand; the BNF requires ** to be followed by a primary
-- Expected Result: Triggers syntax error: missing primary after ** operator
-- Dependencies: None
-- =============================================================
entity fac_snn1_ent is
  port(a : in integer; y : out integer);
end entity;
architecture err of fac_snn1_ent is
begin
  y <= a ** ;
end architecture err;
