-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_SEL_EXPR_OVERLAP
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Negative
-- Test Focus: SMN: overlapping choices — value 0 appears in both when 0 and when 0｜1 branches
-- Expected Result: Triggers semantic error: overlapping choices in selected expression
-- Dependencies: None
-- =============================================================
entity sel_expr_smn1_ent is port(sel:in integer range 0 to 3; a,b,c:in integer; y:out integer); end entity;
architecture bh of sel_expr_smn1_ent is
begin process(sel,a,b,c) variable v:integer; begin with sel select v:=a when 0,b when 0|1,c when 2|3; y<=v; end process; end architecture bh;
