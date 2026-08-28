-- =============================================================
-- Case ID: TC_MULTIPLYING_OPERATOR_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_MULTIPLYING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: multiplying_operator ::= * | / | mod | rem
-- Case Type: Negative
-- Test Focus: SNN: two consecutive multiplying_operators missing the factor in between — in "a * / b" there is no operand between * and /, verifying that the BNF factor { multiplying_operator factor } requires a factor between each pair of operators
-- Expected Result: Triggers syntax error: consecutive multiplying_operators without factor
-- Dependencies: None
-- =============================================================
entity ent_consecutive_ops is
  port (
    a_i : in  integer;
    b_i : in  integer;
    y_o : out integer
  );
end entity ent_consecutive_ops;

architecture rtl of ent_consecutive_ops is
begin
  -- ERROR: consecutive multiplying_operators without factor between them
  y_o <= a_i * / b_i;
end architecture rtl;
