-- =============================================================
-- Case ID: TC_FACTOR_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FACTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: factor ::= primary [ ** primary ] | abs primary | not primary | logical_operator primary
-- Case Type: Negative
-- Test Focus: SNN: not followed by an integer type: not cannot be applied to integer; the not form of the BNF requires the primary to be of boolean/bit/array type
-- Expected Result: Triggers semantic error: 'not' operator requires bit, boolean, or one-dimensional array type
-- Dependencies: None
-- =============================================================
entity fac_snn3_ent is
  port(x : in integer; y : out integer);
end entity;
architecture err of fac_snn3_ent is
begin
  y <= not x;
end architecture err;
