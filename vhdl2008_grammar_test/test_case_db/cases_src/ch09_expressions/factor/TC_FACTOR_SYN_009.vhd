-- =============================================================
-- Case ID: TC_FACTOR_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_FACTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: factor ::= primary [ ** primary ] | abs primary | not primary | logical_operator primary
-- Case Type: Positive
-- Test Focus: nested factor: not(abs(x)) — not applied to an abs primary, verifying the composability of a factor as the primary of another factor
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fac_nested_ent is
  port(val : in integer; zero_flag : out boolean);
end entity;
architecture rtl of fac_nested_ent is
begin
  zero_flag <= not (abs val > 0);
end architecture rtl;
