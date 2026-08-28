-- =============================================================
-- Case ID: TC_FACTOR_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_FACTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: factor ::= primary [ ** primary ] | abs primary | not primary | logical_operator primary
-- Case Type: Negative
-- Test Focus: SNN: factor starting with ** and missing its left primary — in the expression ** b no legal primary precedes the ** exponentiation operator; the power form of factor requires the primary before **
-- Expected Result: Triggers syntax error: unexpected token '**' in a primary
-- Dependencies: None
-- =============================================================
entity fac_missing_left is
  port(b : in integer; y : out integer);
end entity;
architecture vhdl2008 of fac_missing_left is
begin
  y <= ** b;
end architecture vhdl2008;
