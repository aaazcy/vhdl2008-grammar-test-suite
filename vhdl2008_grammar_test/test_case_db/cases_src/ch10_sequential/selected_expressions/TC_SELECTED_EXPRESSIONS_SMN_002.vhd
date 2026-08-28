-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEL_EXPR_TYPE
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Negative
-- Test Focus: SEM: expression types across branches mismatch — integer vs bit_vector in different when branches
-- Expected Result: Triggers semantic error: type mismatch across selected expression branches
-- Dependencies: None
-- =============================================================
entity sel_expr_sem2_ent is port(sel:in integer range 0 to 1; a:in integer; y:out integer); end entity;
architecture bh of sel_expr_sem2_ent is
begin process(sel,a) variable v:integer; begin with sel select v:=a when 0, "1010" when 1; y<=v; end process; end architecture bh;
