-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Positive
-- Test Focus: selected_expressions: with boolean type selection in selected variable assignment using boolean choices
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_expr_syn8_ent is port(flag:in boolean; a,b:in integer; y:out integer); end entity;
architecture bh of sel_expr_syn8_ent is
begin
  process(flag,a,b) is
    variable v:integer;
  begin
    with flag select v :=
      a   when true,
      b   when false;
    y<=v;
  end process;
end architecture bh;
