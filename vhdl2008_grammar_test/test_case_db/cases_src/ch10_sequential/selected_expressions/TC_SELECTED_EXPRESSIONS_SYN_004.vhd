-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Positive
-- Test Focus: selected_expressions: with enumeration type selection expression using element names as choices in selected signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_expr_syn4_ent is port(op:in integer range 0 to 3; y:out integer); end entity;
architecture bh of sel_expr_syn4_ent is
  type t_op is (NOP, ADD, SUB, MUL);
  signal s_sel:t_op;
begin
  with op select s_sel <=
    NOP when 0,
    ADD when 1,
    SUB when 2,
    MUL when 3;
  process(s_sel) is
  begin
    with s_sel select y <=
      0   when NOP,
      5   when ADD,
      10  when SUB,
      20  when MUL;
  end process;
end architecture bh;
