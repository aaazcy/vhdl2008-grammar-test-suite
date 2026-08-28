-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Positive
-- Test Focus: qualified_expression: type_mark'(expression) with integer subtype
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity qual_expr_syn1_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of qual_expr_syn1_ent is
  subtype t_myint is integer range 0 to 1023;
begin
  process(a,b) is
    variable v:t_myint;
  begin
    v := t_myint'(a+b);
    y<=integer(v);
  end process;
end architecture bh;
