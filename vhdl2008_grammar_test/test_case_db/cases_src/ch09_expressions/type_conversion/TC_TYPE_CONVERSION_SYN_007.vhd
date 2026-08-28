-- =============================================================
-- Case ID: TC_TYPE_CONVERSION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_CONVERSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.5
-- Production: type_conversion ::= type_mark ( expression )
-- Case Type: Positive
-- Test Focus: type conversion used in an arithmetic expression: integer(a) + integer(b) converts both operands separately before they take part in the computation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_tc_expr is
  port (
    a, b : in  real;
    y    : out integer
  );
end entity ent_tc_expr;

architecture expr_conv of ent_tc_expr is
begin
  y <= integer(a) + integer(b);
end architecture expr_conv;
