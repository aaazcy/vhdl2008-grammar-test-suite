-- =============================================================
-- Case ID: TC_MULTIPLYING_OPERATOR_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_MULTIPLYING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: multiplying_operator ::= * | / | mod | rem
-- Case Type: Positive
-- Test Focus: all four operators * / mod rem used in a process — in a state machine, * computes multiplication, / normalizes, mod takes the modulo, rem computes the remainder, verifying the complete syntax coverage of the four multiplying_operators in the same architecture
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_all_four_ops is
  port (
    x_i, y_i : in  integer;
    mul_o    : out integer;
    div_o    : out integer;
    mod_o    : out integer;
    rem_o    : out integer
  );
end entity ent_all_four_ops;

architecture rtl of ent_all_four_ops is
begin
  mul_o <= x_i * y_i;
  div_o <= x_i / y_i when y_i /= 0 else 0;
  mod_o <= x_i mod 10;
  rem_o <= x_i rem 10;
end architecture rtl;
