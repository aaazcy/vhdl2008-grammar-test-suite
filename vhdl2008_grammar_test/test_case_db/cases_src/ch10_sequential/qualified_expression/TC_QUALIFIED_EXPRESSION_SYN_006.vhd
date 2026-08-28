-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Positive
-- Test Focus: qualified_expression: type_mark'(expression) with real type to disambiguate integer vs real literals in overloaded function call context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity qual_expr_syn6_ent is port(a:in real; y:out integer); end entity;
architecture bh of qual_expr_syn6_ent is
  function f_scale(x:integer) return integer is
  begin return x*10; end function;
  function f_scale(x:real) return integer is
  begin return integer(x*100.0); end function;
begin
  y <= f_scale(real'(a)) when a>0.0 else 0;
end architecture bh;
