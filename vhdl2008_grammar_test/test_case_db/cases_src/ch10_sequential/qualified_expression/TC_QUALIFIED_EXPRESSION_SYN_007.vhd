-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Positive
-- Test Focus: qualified_expression: type_mark'(expression) with complex arithmetic expression inside parentheses
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity qual_expr_syn7_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of qual_expr_syn7_ent is
  subtype t_byte is integer range 0 to 255;
begin
  process(a,b) is
    variable v:t_byte;
  begin
    v := t_byte'((a+b) mod 256);
    y <= integer(v);
  end process;
end architecture bh;
