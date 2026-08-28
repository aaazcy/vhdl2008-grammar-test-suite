-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Positive
-- Test Focus: qualified_expression: type_mark'aggregate with record type for disambiguation in overloaded context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity qual_expr_syn4_ent is port(y:out integer); end entity;
architecture bh of qual_expr_syn4_ent is
  type t_rec is record
    a:integer; b:integer;
  end record;
  signal s_rec:t_rec;
begin
  s_rec <= t_rec'(a=>10, b=>20);
  y<=s_rec.a+s_rec.b;
end architecture bh;
