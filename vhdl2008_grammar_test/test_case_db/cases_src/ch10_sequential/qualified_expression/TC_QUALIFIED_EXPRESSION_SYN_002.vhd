-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Positive
-- Test Focus: qualified_expression: type_mark'aggregate with array type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity qual_expr_syn2_ent is port(y:out integer); end entity;
architecture bh of qual_expr_syn2_ent is
  type t_vec is array(0 to 3) of integer;
  signal s_arr:t_vec;
begin
  s_arr <= t_vec'(0=>10, 1=>20, 2=>30, 3=>40);
  y<=s_arr(0)+s_arr(3);
end architecture bh;
