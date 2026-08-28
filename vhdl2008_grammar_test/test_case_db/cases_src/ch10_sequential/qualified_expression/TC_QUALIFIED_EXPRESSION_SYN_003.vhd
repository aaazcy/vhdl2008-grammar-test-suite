-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Positive
-- Test Focus: qualified_expression: resolving overloaded subprogram call via qualification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity qual_expr_syn3_ent is port(a,b:in real; y:out integer); end entity;
architecture bh of qual_expr_syn3_ent is
  type t_score is range 0 to 1000;
  function f_scale(x:real) return integer is
  begin return integer(x*10.0); end function;
  function f_scale(x:real) return t_score is
  begin return t_score(integer(x*100.0)); end function;
begin
  process(a,b) is
    variable v:t_score;
  begin
    v := t_score'(f_scale(a+b));
    y <= integer(v);
  end process;
end architecture bh;
