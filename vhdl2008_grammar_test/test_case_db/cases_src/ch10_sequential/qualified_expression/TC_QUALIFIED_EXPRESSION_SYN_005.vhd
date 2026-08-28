-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Positive
-- Test Focus: qualified_expression: type_mark'(expression) used to resolve overloaded enumeration literal in case expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity qual_expr_syn5_ent is port(sel:in bit; y:out integer); end entity;
architecture bh of qual_expr_syn5_ent is
  subtype t_level is integer range 0 to 15;
  signal s_val:t_level;
begin
  process(sel) is
  begin
    s_val <= t_level'(5) when sel='1' else t_level'(0);
  end process;
  y<=integer(s_val);
end architecture bh;
