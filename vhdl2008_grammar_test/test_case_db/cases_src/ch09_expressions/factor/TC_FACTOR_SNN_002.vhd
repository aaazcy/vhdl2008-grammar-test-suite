-- =============================================================
-- Case ID: TC_FACTOR_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_FACTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: factor ::= primary [ ** primary ] | abs primary | not primary | logical_operator primary
-- Case Type: Negative
-- Test Focus: SNN: abs followed by a non-numeric type: abs applied to bit_vector; abs requires the operand to be a numeric type
-- Expected Result: Triggers semantic error: abs requires numeric operand type
-- Dependencies: None
-- =============================================================
entity fac_snn2_ent is
  port(v : in bit_vector(3 downto 0); y : out bit_vector(3 downto 0));
end entity;
architecture err of fac_snn2_ent is
begin
  y <= abs v;
end architecture err;
