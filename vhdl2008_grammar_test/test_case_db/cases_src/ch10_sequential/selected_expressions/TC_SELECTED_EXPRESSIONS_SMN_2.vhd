-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEL_EXPR_COVERAGE
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Rule Description: Selected expressions must cover all possible values of selection expression
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SEM: missing value coverage - only 0,1,2 covered for range 0 to 3 (missing 3, no others)
-- Expected Result: Triggers semantic error: incomplete coverage in selected assignment
-- Dependencies: None
-- =============================================================
entity sel_expr_sem1_ent is port(sel:in integer range 0 to 3; a,b,c:in integer; y:out integer); end entity;
architecture bh of sel_expr_sem1_ent is
begin process(sel,a,b,c) variable v:integer; begin with sel select v:=a when 0,b when 1,c when 2; y<=v; end process; end architecture bh;
