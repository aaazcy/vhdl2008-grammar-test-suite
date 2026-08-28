-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Positive
-- Test Focus: selected_expressions: single expression when choices per branch in selected variable assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_expr_syn1_ent is port(sel:in integer range 0 to 3; a,b,c,d:in integer; y:out integer); end entity;
architecture bh of sel_expr_syn1_ent is
begin
  process(sel,a,b,c,d) is
    variable v:integer;
  begin
    with sel select v :=
      a when 0,
      b when 1,
      c when 2,
      d when 3;
    y<=v;
  end process;
end architecture bh;
