-- =============================================================
-- Case ID: TC_FACTOR_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_FACTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: factor ::= primary [ ** primary ] | abs primary | not primary | logical_operator primary
-- Case Type: Positive
-- Test Focus: not prefix form: the factor is not primary; the bit vector is inverted and then output
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fac_not_ent is
  port(din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity;
architecture rtl of fac_not_ent is
begin
  dout <= not din;
end architecture rtl;
