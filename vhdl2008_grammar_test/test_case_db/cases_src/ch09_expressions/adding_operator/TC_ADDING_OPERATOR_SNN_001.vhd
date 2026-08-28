-- =============================================================
-- Case ID: TC_ADDING_OPERATOR_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ADDING_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: adding_operator ::= + | - | &
-- Case Type: Negative
-- Test Focus: SNN: missing the term to the right of the + operator - the expression "a_i + " is followed by a semicolon with no operand, verifying that adding_operator requires a term on its right side as an operand and that the last term of term { adding_operator term } in simple_expression cannot be omitted
-- Expected Result: Triggers syntax error: missing operand after adding_operator
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
  -- ERROR: missing right operand after adding_operator +
  y_o <= a_i + ;
end architecture rtl;
