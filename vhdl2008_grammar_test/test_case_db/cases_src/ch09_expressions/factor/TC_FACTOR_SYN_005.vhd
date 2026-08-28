-- =============================================================
-- Case ID: TC_FACTOR_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_FACTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: factor ::= primary [ ** primary ] | abs primary | not primary | logical_operator primary
-- Case Type: Positive
-- Test Focus: and logical operator prefix: in the logical_operator primary form, a bit_vector is bitwise and-ed with a constant mask
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fac_andop_ent is
  port(din : in bit_vector(3 downto 0); out_val : out bit);
end entity;
architecture rtl of fac_andop_ent is
  constant MASK : bit_vector(3 downto 0) := "1010";
begin
  out_val <= and (MASK and din);
end architecture rtl;
