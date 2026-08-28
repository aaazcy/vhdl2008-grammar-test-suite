-- =============================================================
-- Case ID: TC_FACTOR_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_FACTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: factor ::= primary [ ** primary ] | abs primary | not primary | logical_operator primary
-- Case Type: Negative
-- Test Focus: SNN: logical_operator missing its primary: no operand after the and operator; the BNF requires logical_operator to be followed by a primary
-- Expected Result: Triggers syntax error: missing primary after logical_operator
-- Dependencies: None
-- =============================================================
entity fac_snn5_ent is
  port(din : in bit_vector(7 downto 0); y : out bit_vector(7 downto 0));
end entity;
architecture err of fac_snn5_ent is
begin
  y <= not and;
end architecture err;
