-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Negative
-- Test Focus: SNN: trailing comma without following expression-when-choices
-- Expected Result: Triggers syntax error: unexpected trailing comma
-- Dependencies: None
-- =============================================================
entity sel_expr_snn2_ent is port(sel:in integer range 0 to 1; a,b:in integer; y:out integer); end entity;
architecture bh of sel_expr_snn2_ent is
begin process(sel,a,b) variable v:integer; begin with sel select v:=a when 0,; y<=v; end process; end architecture bh;
