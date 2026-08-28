-- =============================================================
-- Case ID: TC_TYPE_CONVERSION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_CONVERSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.5
-- Production: type_conversion ::= type_mark ( expression )
-- Case Type: Negative
-- Test Focus: SNN: two expressions inside the type conversion parentheses——in integer(a, 2), the parentheses contain two expressions a and 2, but the parentheses of a type_conversion allow only one expression
-- Expected Result: Triggers syntax error: type conversion allows only one expression
-- Dependencies: None
-- =============================================================

entity tyconv_two_exprs is
  port (a : in integer; y : out integer);
end entity tyconv_two_exprs;

architecture vhdl2008 of tyconv_two_exprs is
begin
  y <= integer(a, 2);
end architecture vhdl2008;
