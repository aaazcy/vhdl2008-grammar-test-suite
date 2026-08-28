-- =============================================================
-- Case ID: TC_FACTOR_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_FACTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: factor ::= primary [ ** primary ] | abs primary | not primary | logical_operator primary
-- Case Type: Positive
-- Test Focus: multi-form combination: factors of the abs / not / ** / logical_operator forms used together in one assignment statement, demonstrating the coexistence of all syntactic forms
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fac_multi_ent is
  port(a, b : in integer; v : in bit_vector(7 downto 0); r1 : out integer; r2 : out bit; r3 : out bit_vector(7 downto 0));
end entity;
architecture rtl of fac_multi_ent is
begin
  r1 <= abs(a) ** 2;
  r2 <= or v;
  r3 <= not v;
end architecture rtl;
