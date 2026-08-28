-- =============================================================
-- Case ID: TC_FACTOR_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_FACTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: factor ::= primary [ ** primary ] | abs primary | not primary | logical_operator primary
-- Case Type: Positive
-- Test Focus: complex exponentiation: the primary is a parenthesized simple expression; the combined expression uses abs containing a power operation, simulating signal magnitude squared calculation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fac_complex_pow_ent is
  port(i_val, q_val : in integer; pwr_out : out integer);
end entity;
architecture rtl of fac_complex_pow_ent is
begin
  pwr_out <= i_val ** 2 + q_val ** 2;
end architecture rtl;
