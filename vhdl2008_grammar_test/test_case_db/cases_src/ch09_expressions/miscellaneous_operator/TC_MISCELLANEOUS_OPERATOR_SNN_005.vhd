-- =============================================================
-- Case ID: TC_MISCELLANEOUS_OPERATOR_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_MISCELLANEOUS_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: miscellaneous_operator ::= ** | abs | not
-- Case Type: Negative
-- Test Focus: SNN: missing parentheses between the left and right operands of the ** operator causes ambiguity — "2 ** 3 + 1" follows the precedence rule that ** binds tighter than +, but if the intent is 2**(3+1) parentheses are needed, this line verifies the syntax that ** without parentheses applies only to the adjacent primary, while a ** in the wrong position causes a syntax error
-- Expected Result: Triggers syntax error: missing right operand after ** (or ambiguous expression)
-- Dependencies: None
-- =============================================================
entity ent_power_no_rhs is
  port (
    base_i : in  integer;
    y_o    : out integer
  );
end entity ent_power_no_rhs;

architecture rtl of ent_power_no_rhs is
begin
  -- ERROR: missing exponent operand after **
  y_o <= base_i ** ;
end architecture rtl;
