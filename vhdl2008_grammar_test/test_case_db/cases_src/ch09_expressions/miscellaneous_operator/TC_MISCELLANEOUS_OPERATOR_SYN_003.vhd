-- =============================================================
-- Case ID: TC_MISCELLANEOUS_OPERATOR_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_MISCELLANEOUS_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: miscellaneous_operator ::= ** | abs | not
-- Case Type: Positive
-- Test Focus: the ** operator computes an integer power — an exponentiation operation (2**n) with both base and exponent integers, verifying the use of ** as the power operation in a factor within an expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_power_int is
  port (
    exp_i : in  integer range 0 to 7;
    pwr_o : out integer range 1 to 128
  );
end entity ent_power_int;

architecture rtl of ent_power_int is
begin
  pwr_o <= 2 ** exp_i;
end architecture rtl;
