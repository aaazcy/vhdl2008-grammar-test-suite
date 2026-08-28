-- =============================================================
-- Case ID: TC_RELATIONAL_OPERATOR_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIONAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relational_operator ::= = | /= | < | <= | > | >= | ?= | ?/= | ?< | ?<= | ?> | ?>=
-- Case Type: Negative
-- Test Focus: SNN: missing shift_expression to the right of the relational_operator——"a_i =" is followed by a semicolon with no comparison operand, verifying that the shift_expression to the right of the relational_operator in BNF relation ::= shift_expression [ relational_operator shift_expression ] cannot be omitted
-- Expected Result: Triggers syntax error: missing right operand after relational_operator
-- Dependencies: None
-- =============================================================
entity ent_missing_rhs is
  port (
    a_i : in  integer;
    y_o : out boolean
  );
end entity ent_missing_rhs;

architecture rtl of ent_missing_rhs is
begin
  -- ERROR: missing right operand after relational_operator =
  y_o <= a_i = ;
end architecture rtl;
