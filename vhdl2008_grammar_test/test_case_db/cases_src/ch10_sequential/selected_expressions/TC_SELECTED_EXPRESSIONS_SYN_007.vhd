-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Positive
-- Test Focus: selected_expressions: with OTHERS as catch-all choices using when others syntax
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_expr_syn7_ent is port(addr:in integer range 0 to 15; y:out integer); end entity;
architecture bh of sel_expr_syn7_ent is
begin
  with addr select y <=
    100 when 0 to 3,
    200 when 4|5|6|7,
    300 when 8 to 11,
    400 when others;
end architecture bh;
