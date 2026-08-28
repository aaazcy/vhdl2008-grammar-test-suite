-- =============================================================
-- Case ID: TC_MULTIPLYING_OPERATOR_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_MULTIPLYING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: multiplying_operator ::= * | / | mod | rem
-- Case Type: Negative
-- Test Focus: SNN: missing factor on the right side of multiplying_operator — the expression "a *" is followed directly by a semicolon with no operand, verifying that the BNF factor { multiplying_operator factor } requires a factor on the right side of every multiplying_operator, which cannot be omitted
-- Expected Result: Triggers syntax error: missing factor after multiplying_operator *
-- Dependencies: None
-- =============================================================
entity ent_missing_rhs is
  port (
    a_i : in  integer;
    y_o : out integer
  );
end entity ent_missing_rhs;

architecture rtl of ent_missing_rhs is
begin
  -- ERROR: missing right operand (factor) after multiplying_operator *
  y_o <= a_i * ;
end architecture rtl;
