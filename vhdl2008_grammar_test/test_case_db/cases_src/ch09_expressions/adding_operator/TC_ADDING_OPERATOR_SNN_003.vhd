-- =============================================================
-- Case ID: TC_ADDING_OPERATOR_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ADDING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: adding_operator ::= + | - | &
-- Case Type: Negative
-- Test Focus: SNN: missing term between two consecutive adding_operators - in the expression "a + - c" without parentheses the second adding_operator (-) lacks an intermediate term, verifying that the BNF term { adding_operator term } requires a term between every pair of adding_operators
-- Expected Result: Triggers syntax error: consecutive operators without operand
-- Dependencies: None
-- =============================================================
entity ent_double_op is
  port (
    a_i : in  integer;
    c_i : in  integer;
    y_o : out integer
  );
end entity ent_double_op;

architecture rtl of ent_double_op is
begin
  -- ERROR: consecutive adding_operators without intervening term
  y_o <= a_i + - c_i;
end architecture rtl;
