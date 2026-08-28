-- =============================================================
-- Case ID: TC_MULTIPLYING_OPERATOR_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_MULTIPLYING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: multiplying_operator ::= * | / | mod | rem
-- Case Type: Negative
-- Test Focus: SNN: missing factor on the left side of multiplying_operator — the expression "/ b_i" starts with a division sign, verifying that multiplying_operator must appear between two factors, it cannot start an expression with the left operand missing
-- Expected Result: Triggers syntax error: missing left factor for multiplying_operator /
-- Dependencies: None
-- =============================================================
entity ent_missing_lhs is
  port (
    b_i : in  integer;
    y_o : out integer
  );
end entity ent_missing_lhs;

architecture rtl of ent_missing_lhs is
begin
  -- ERROR: missing left operand (factor) for multiplying_operator /
  y_o <= / b_i;
end architecture rtl;
