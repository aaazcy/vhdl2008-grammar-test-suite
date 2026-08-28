-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Positive
-- Test Focus: selected_expressions: multiple expression when choices with pipe-separated ranges
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_expr_syn2_ent is port(sel:in integer range 0 to 7; a,b,c:in integer; y:out integer); end entity;
architecture bh of sel_expr_syn2_ent is
begin
  process(sel,a,b,c) is
    variable v:integer;
  begin
    with sel select v :=
      a when 0|1|2,
      b when 3|4|5,
      c when 6|7;
    y<=v;
  end process;
end architecture bh;
