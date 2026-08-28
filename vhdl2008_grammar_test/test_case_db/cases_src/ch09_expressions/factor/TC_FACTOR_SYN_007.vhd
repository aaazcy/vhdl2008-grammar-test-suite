-- =============================================================
-- Case ID: TC_FACTOR_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_FACTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: factor ::= primary [ ** primary ] | abs primary | not primary | logical_operator primary
-- Case Type: Positive
-- Test Focus: xor reduction operator: xor primary generates the even/odd parity bit for wide data
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fac_xorop_ent is
  port(word_in : in bit_vector(15 downto 0); parity_out : out bit);
end entity;
architecture rtl of fac_xorop_ent is
begin
  parity_out <= xor word_in;
end architecture rtl;
