-- =============================================================
-- Case ID: TC_MISCELLANEOUS_OPERATOR_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_MISCELLANEOUS_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: miscellaneous_operator ::= ** | abs | not
-- Case Type: Positive
-- Test Focus: combined use of abs and ** in the same expression — computing the square of the absolute value of the vector difference, verifying the combination of two miscellaneous_operators nested with parentheses in a single expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_abs_power is
  port (
    a_i  : in  integer range -15 to 15;
    b_i  : in  integer range -15 to 15;
    d2_o : out integer range 0 to 900
  );
end entity ent_abs_power;

architecture rtl of ent_abs_power is
begin
  d2_o <= abs(a_i - b_i) ** 2;
end architecture rtl;
