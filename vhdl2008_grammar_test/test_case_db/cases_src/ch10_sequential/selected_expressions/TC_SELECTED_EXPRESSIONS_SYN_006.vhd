-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Positive
-- Test Focus: selected_expressions: with computed expression (not just literal) on each when branch — arithmetic operations per branch
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_expr_syn6_ent is port(sel:in integer range 0 to 3; base:in integer; y:out integer); end entity;
architecture bh of sel_expr_syn6_ent is
begin
  with sel select y <=
    base      when 0,
    base+1    when 1,
    base*2    when 2,
    base/2    when 3;
end architecture bh;
