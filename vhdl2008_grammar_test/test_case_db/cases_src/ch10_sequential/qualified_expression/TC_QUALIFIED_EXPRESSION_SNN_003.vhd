-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Negative
-- Test Focus: SNN: qualified expression with missing closing parenthesis — type_mark'(expr without )
-- Expected Result: Triggers syntax error: missing closing parenthesis
-- Dependencies: None
-- =============================================================
entity qual_expr_snn3_ent is port(a:in integer; y:out integer); end entity;
architecture bh of qual_expr_snn3_ent is
  type t_my is range 0 to 255;
begin process(a) begin y<=integer(t_my'(a); end process; end architecture bh;
