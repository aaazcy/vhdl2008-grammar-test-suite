-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Positive
-- Test Focus: use in a signal assignment: s <= integer'(a + b) qualifies the result of the arithmetic expression as integer type before the assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_qe_assign is
  port (
    a, b : in  integer;
    y    : out integer
  );
end entity ent_qe_assign;

architecture in_assign of ent_qe_assign is
begin
  y <= integer'(a + b);
end architecture in_assign;
