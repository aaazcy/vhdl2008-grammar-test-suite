-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Positive
-- Test Focus: selected_expressions: in selected force assignment with arithmetic expressions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_expr_syn3_ent is port(op:in integer range 0 to 3; a,b:in integer; y:out integer); end entity;
architecture bh of sel_expr_syn3_ent is
  signal s_targ:integer:=0;
begin
  process(op,a,b) is
  begin
    with op select s_targ <=
      a+b   when 0,
      a-b   when 1,
      a*b   when 2,
      0     when 3;
  end process;
  y<=s_targ;
end architecture bh;
